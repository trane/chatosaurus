//
//  CSChannelGridView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChannelGridView.h"

#pragma mark -
#pragma mark Private Interface
@interface CSChannelGridView ()
@end

#pragma mark -
@implementation CSChannelGridView

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
    [_notify release];
    [_scrollView release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize notify = _notify;
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
}

@end
