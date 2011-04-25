//
//  CSChannelGridView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChannelGridView.h"
#import "CSChannelViewCell.h"

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

@synthesize visibleRows = _visibleRows;

#pragma mark -
#pragma mark Methods
- (void) reload
{
    // TODO
}

#pragma mark UIView Methods
- (void) layoutSubviews
{
    // Set the size of the cells, based on user preferences (default 4 x 1
    _cellSize = CGSizeMake([self bounds].size.width / (CGFloat)_visibleCols,
                           [self bounds].size.height / (CGFloat)_visibleRows);
    
    // Grab the counts
    _colCount = [_notify channelColumnCount:self];
    _rowCount = [_notify channelRowCount:self];
    
    // Set the total view size for the cells
    CGSize contentSize = CGSizeMake((CGFloat)_colCount * _cellSize.width,
                                    (CGFloat)_rowCount * _cellSize.height);
    
    [_scrollView setContentSize:contentSize];
    
    [self scrollViewDidScroll:_scrollView];
}

#pragma mark UIScrollViewDelegate Methods
- (void) scrollViewDidScroll:(UIScrollView*)scrollView
{
    CGRect visibleView = CGRectMake([_scrollView bounds].origin.x, 
                                    [_scrollView bounds].origin.y,
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
    
    NSMutableArray *outofboundCells = [NSMutableArray array];
    for (CSChannelViewCell *cell in _cells) {
        
    }
}

@end
