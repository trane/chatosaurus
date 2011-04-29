//
//  CSServerTableViewCell.m
//  Chatosaurus
//
//  Created by trane on 4/27/11.
//  Copyright 2011 home. All rights reserved.
//

#import "CSServerTableViewCell.h"

#pragma mark -
#pragma mark Private Interface
@interface CSServerTableViewCell ()
@end

#pragma mark -
@implementation CSServerTableViewCell

#pragma mark Constructors
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    //if (self == [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    _serverView = [[CSServerView alloc] initWithFrame:frame protocol:@"irc" serverName:@"Blah" userId:@"hello"];
    [[self contentView] addSubview:_serverView];
    [self setNeedsLayout];
//        primaryLabel = [[UILabel alloc]init];
//        primaryLabel.textAlignment = UITextAlignmentLeft;
//        primaryLabel.font = [UIFont systemFontOfSize:14];
//        secondaryLabel = [[UILabel alloc]init];
//        secondaryLabel.textAlignment = UITextAlignmentLeft;
//        secondaryLabel.font = [UIFont systemFontOfSize:8];
//        myImageView = [[UIImageView alloc]init];
//        [self.contentView addSubview:primaryLabel];
//        [self.contentView addSubview:secondaryLabel];
//        [self.contentView addSubview:myImageView];
        
    //}
    return self;
}

- (void) dealloc 
{
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize serverView = _serverView;

#pragma mark -
#pragma mark Methods

#pragma mark UIView Methods
- (void) layoutSubviews
{
}
//- (void)drawRect:(CGRect)rect {
//    
//    // set up #define constants and fonts here ...
//    // set up text colors for main and secondary text in normal and highlighted cell states...
//    
//    CGRect contentRect = self.bounds;
//    if (!self.editing) {
//        CGFloat boundsX = contentRect.origin.x;
//        CGPoint point;
//        CGFloat actualFontSize;
//        CGSize size;
//        
//        // draw main text
//        [mainTextColor set];
//        
//        // draw time-zone locale string
//        point = CGPointMake(boundsX + LEFT_COLUMN_OFFSET, UPPER_ROW_TOP);
//        [timeZoneWrapper.timeZoneLocaleName drawAtPoint:point forWidth:LEFT_COLUMN_WIDTH withFont:mainFont minFontSize:MIN_MAIN_FONT_SIZE actualFontSize:NULL lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
//        
//        // ... other strings drawn here...
//        
//        // draw secondary text
//        [secondaryTextColor set];
//        
//        // draw the time-zone abbreviation
//        point = CGPointMake(boundsX + LEFT_COLUMN_OFFSET, LOWER_ROW_TOP);
//        [abbreviation drawAtPoint:point forWidth:LEFT_COLUMN_WIDTH withFont:secondaryFont minFontSize:MIN_SECONDARY_FONT_SIZE actualFontSize:NULL lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
//        
//        // ... other strings drawn here...
//        
//        // Draw the quarter image.
//        CGFloat imageY = (contentRect.size.height - timeZoneWrapper.image.size.height) / 2;
//        point = CGPointMake(boundsX + RIGHT_COLUMN_OFFSET, imageY);
//        [timeZoneWrapper.image drawAtPoint:point];
//    }
//}
#pragma mark UITableViewCell Methods
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
//        CGRect serverViewFrame = CGRectMake(0.0, 0.0, self.contentView.bounds.size.width,
//                                     self.contentView.bounds.size.height);
//        _serverView = [[CSServerView alloc] initWithFrame:serverViewFrame protocol:@"irc" serverName:@"Blah" userId:@"hello"];
//        _serverView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        [[self contentView] addSubview:_serverView];
    }
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    return self;
}
- (void) redisplay
{

}
@end
