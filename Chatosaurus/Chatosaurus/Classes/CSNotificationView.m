//
//  CSNotificationView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSNotificationView.h"

#pragma mark -
#pragma mark Private Interface
@interface CSNotificationView ()
@end

#pragma mark -
@implementation CSNotificationView

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
	if (self == nil)
		return nil;
    
    _notificationView = [[UITableView alloc] 
                         initWithFrame:CGRectMake(frame.origin.x, 
                                                  frame.origin.y, 
                                                  frame.size.width, 
                                                  frame.size.height - 15)];
    _dragHandle = [[UIButton buttonWithType:UIButtonTypeInfoDark] retain];
    [_dragHandle setFrame:CGRectMake(frame.origin.x, 
                                     frame.origin.y + frame.size.height - 15, 
                                     frame.size.width, 
                                     15)];
    [_dragHandle addTarget:self action:@selector(handleTouch:event:) forControlEvents:UIControlEventAllTouchEvents];
	
    return self;
}

- (void) dealloc 
{
    [_notificationView release];
    [_dragHandle release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark Methods

#pragma mark -
#pragma mark Event Handlers/Delegate Methods
- (void) handleTouch:(id)sender event:(UIEvent*)event
{
    
}

#pragma mark UIView Methods
- (void) layoutSubviews
{
}

@end
