//
//  CSChannelGridView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChannelGridView.h"
#import "CSChannelViewCell.h"
#import "CSChannelView.h"

#pragma mark -
#pragma mark Private Interface
@interface CSChannelGridView () <UIScrollViewDelegate>
@end

#pragma mark -
@implementation CSChannelGridView

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
	if (self == nil)
		return nil;
	
    // All channels will be horizontally scrollable in this view
    _scrollView = [[UIScrollView alloc] initWithFrame:frame];
    [_scrollView setDelegate:self];

    // Make sure it only scrolls horizontally, and has a bounce effect
    [_scrollView setBounces:TRUE];
    [_scrollView setShowsHorizontalScrollIndicator:TRUE];
    [_scrollView setAlwaysBounceHorizontal:TRUE];
    [self addSubview:_scrollView];
    
    // Set initial values
    _cells = [[NSMutableArray alloc] init];
    _cellSize = CGSizeZero;
    _workingSize = CGSizeZero;

    _visibleCols = 1.0f;
    _visibleRows = 1.0f;
    _rowCount = 0;
    _colCount = 0;
    
    return self;
}

- (void) dealloc 
{
    [self setNotify:nil];
    [_scrollView release];
    [_cells release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize notify = _notify;
- (void) setNotify:(NSObject<ChannelGridViewNotification> *)notify
{
    _notify = notify;
    [self reload];
}

@synthesize visibleCols = _visibleCols;
- (void) setVisibleCols:(CGFloat)visibleCols
{
    _visibleCols = visibleCols;
    [self setNeedsLayout];
}

@synthesize visibleRows = _visibleRows;
- (void) setVisibleRows:(CGFloat)visibleRows
{
    _visibleRows = visibleRows;
    [self setNeedsLayout];
}
#pragma mark -
#pragma mark Methods
- (void) reload
{
    _workingSize = CGSizeZero;
    [self setNeedsLayout];
}

#pragma mark UIView Methods
- (void) layoutSubviews
{
    // Only call this when changing the viewing area
	if (CGSizeEqualToSize([self bounds].size, _workingSize) == FALSE)
	{
        // this was set to CGRectZero
        _workingSize = [self bounds].size;
            
        [_scrollView setFrame:CGRectMake(0.0f, 0.0f, _workingSize.width, _workingSize.height)];
        // Set the size of the cells, based on user preferences (default 4 x 1
        _cellSize.width = [self bounds].size.width / (CGFloat)_visibleCols;
        _cellSize.height = [self bounds].size.height / (CGFloat)_visibleRows;

        // Grab the counts
        _colCount = [_notify channelColumnCount:self];
        _rowCount = [_notify channelRowCount:self];
        
        CGSize contentSize = CGSizeZero;
        // Set the total view size for the cells
        contentSize = CGSizeMake((CGFloat)_colCount * _cellSize.width, 
                                 (CGFloat)_rowCount * _cellSize.height);

        
        [_scrollView setContentSize:contentSize];
        
        [self scrollViewDidScroll:_scrollView];
    }
}

#pragma mark UIScrollViewDelegate Methods
- (void) scrollViewDidScroll:(UIScrollView*)scrollView
{
    // Calculate what is currently in view
    CGRect visibleView = CGRectMake([_scrollView contentOffset].x, 
                                    [_scrollView contentOffset].y,
                                    [_scrollView bounds].size.width,
                                    [_scrollView bounds].size.height);
    
    int cellCol1 = floorf(CGRectGetMinX(visibleView) / _cellSize.width);
    int cellColN = ceilf(CGRectGetMaxX(visibleView) / _cellSize.width);
    int cellRow1 = floorf(CGRectGetMinY(visibleView) / _cellSize.height);
    int cellRowN = ceilf(CGRectGetMaxY(visibleView) / _cellSize.height);
    
    // Never get views outside of bounds
    if (cellColN < 0)
        cellColN = 0;
    if (cellColN > _colCount)
        cellColN = _colCount;
    if (cellCol1 < 0)
        cellCol1 = 0;
    if (cellCol1 > cellColN)
        cellCol1 = cellColN;
    if (cellRowN < 0)
        cellRowN = 0;
    if (cellRowN > _rowCount)
        cellRowN = _rowCount;
    if (cellRow1 < 0)
        cellRow1 = 0;
    if (cellRow1 > cellRowN)
        cellRow1 = cellRowN;
    
    // Find cells that are out of visible bounds from the grid
    NSMutableArray *outofboundCells = [NSMutableArray array];
    for (CSChannelViewCell *cell in _cells) {
        if ([cell col] < cellCol1 || 
            [cell col] > cellColN ||
            [cell row] < cellRow1 ||
            [cell row] > cellRowN) {
            [outofboundCells addObject:cell];
        }
    }
    
    // Remove the out of bounds cells from the view
    [outofboundCells makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_cells removeObjectsInArray:outofboundCells];
    
    // Iterate through all visible cells, and if new, create them.
    for (NSUInteger cellRow = cellRow1; cellRow < cellRowN; cellRow++) {
        for (NSUInteger cellCol = cellCol1; cellCol < cellColN; cellCol++) {
            
            // Check if the cell already has been created
            BOOL cellExists = FALSE;
            
            for (CSChannelViewCell *cell in _cells) {
                if ([cell row] == cellRow && [cell col] == cellCol) {
                    cellExists = TRUE;
                    break;
                }
            }
            
            // If the cell doesn't exist, create its view
            if (cellExists == FALSE) {
                CSChannelView *channelView = [_notify channelGridView:self 
                                                        viewCellAtRow:cellRow
                                                               column:cellCol];
                CSChannelViewCell *cell = [[[CSChannelViewCell alloc] init] autorelease];
                [cell setRow:cellRow];
                [cell setCol:cellCol];
                [cell setChannelView:channelView];
                [_cells addObject:cell];
                [cell setBackgroundColor:[UIColor whiteColor]];
                [_scrollView insertSubview:cell atIndex:0];
            }
        }
    }
    
    // Create the proper size for each cell
    for (CSChannelViewCell *cell in _cells) {
        CGRect frame = CGRectMake((CGFloat)[cell col] * _cellSize.width,
                                  (CGFloat)[cell row] * _cellSize.height,
                                  _cellSize.width,
                                  _cellSize.height);
        [cell setFrame:frame];
    }

}

@end
