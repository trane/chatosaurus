//
//  CSChannelGridView.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

@class CSChannelGridView;

@protocol ChannelGridViewNotification
- (NSUInteger) channelRowCount:(CSChannelGridView*)gridView;
- (NSUInteger) channelColumnCount:(CSChannelGridView*)gridView;
- (NSUInteger) channelGridView:(CSChannelGridView*)gridView viewCellAtRow:(NSInteger)row column:(NSInteger)col;
@end

@interface CSChannelGridView : UIView 
{
    NSObject<ChannelGridViewNotification> *_notify;
    UIScrollView *_scrollView;
    
    NSUInteger _rowCount;
    NSUInteger _colCount;
    
    CGSize _cellSize;
    
    CGFloat _visibleCols;
    CGFloat _visibleRows;
    
    NSMutableArray *_cells;

}

@property (nonatomic,assign) NSObject<ChannelGridViewNotification> *notify;
@property (nonatomic,assign) CGFloat visibleCols;
@property (nonatomic,assign) CGFloat visibleRows;


- (void) reload;

@end
