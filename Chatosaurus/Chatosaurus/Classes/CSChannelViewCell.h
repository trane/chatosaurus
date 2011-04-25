//
//  CSChannelViewCell.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

@interface CSChannelViewCell : UIView 
{
    UIView *_channelView;
    
    NSUInteger _col;
    NSUInteger _row;
}

/*!
 * Holds the actual channel view for this cell
 */
@property (nonatomic,assign) UIView *channelView;

/*!
 * The row this cell belongs to
 */
@property (nonatomic,assign) NSUInteger col;

/*!
 * The column this cell belongs to
 */
@property (nonatomic,assign) NSUInteger row;

@end
