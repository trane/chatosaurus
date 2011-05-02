//
//  CSChannelViewCell.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChannelViewCell.h"

#pragma mark -
#pragma mark Private Interface
@interface CSChannelViewCell ()
@end

#pragma mark -
@implementation CSChannelViewCell

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
	if (self == nil)
		return nil;
	
    return self;
}

- (void) dealloc 
{
    [_channelView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize col = _col;
@synthesize row = _row;

@synthesize channelView = _channelView;
- (void) setChannelView:(UIView *)channelView
{
    [_channelView removeFromSuperview];
    [_channelView autorelease];
    
    _channelView = [channelView retain];
    [self addSubview:_channelView];

    [self setNeedsLayout];
}

#pragma mark -
#pragma mark Methods

#pragma mark UIView Methods
- (void) layoutSubviews
{
    CGRect rect = CGRectInset([self bounds], 1.0f, 1.0f);
    [_channelView setFrame:rect];
}

@end
