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
    
    _dragging = FALSE;
    
    _notificationView = [[UITableView alloc] 
                         initWithFrame:CGRectMake(frame.origin.x, 
                                                  frame.origin.y, 
                                                  frame.size.width, 
                                                  frame.size.height - 15)];
    [_notificationView setDataSource:self];
    [_notificationView setBackgroundColor:[UIColor blackColor]];
    [_notificationView setAlpha:0.8f];
    _dragHandle = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, 
                                     frame.origin.y + frame.size.height - 15, 
                                     frame.size.width, 
                                     15)];
    [_dragHandle setBackgroundColor:[UIColor darkGrayColor]];
    
    [self addSubview:_notificationView];
    [self addSubview:_dragHandle];
	
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

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Get touch point
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    UIView* touchedView = [self hitTest:touchPoint withEvent:nil];
    if(touchedView == _dragHandle)
    {
        _dragging = TRUE;
        
        //Find new height
        int height = touchPoint.y - [self frame].origin.y;
        if (height < 15)
            height = 15;
        if (height > 416)
            height = 416;
        
        //Set up new frame
        [self setFrame:CGRectMake([self frame].origin.x, 
                                  [self frame].origin.y, 
                                  [self frame].size.width, 
                                  height)];
        [self setNeedsLayout];
        [self setNeedsDisplay];
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!_dragging)
        return;
    
    //Get touch point
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    //Find new height
    int height = touchPoint.y - [self frame].origin.y;
    if (height < 15)
        height = 15;
    if (height > 416)
        height = 416;
    
    //Set up new frame
    [self setFrame:CGRectMake([self frame].origin.x, 
                              [self frame].origin.y, 
                              [self frame].size.width, 
                              height)];
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _dragging = FALSE;
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    _dragging = FALSE;
}

- (void) keyboardShow
{
    _prevHeight = [self frame].size.height;
    [self setFrame:CGRectMake([self frame].origin.x, [self frame].origin.y, [self frame].size.width, 15)];
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

- (void) keyboardHide
{
    [self setFrame:CGRectMake([self frame].origin.x, [self frame].origin.y, [self frame].size.width, _prevHeight)];
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

#pragma mark -
#pragma mark Event Handlers/Delegate Methods
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

#pragma mark UIView Methods
- (void) layoutSubviews
{
    CGRect frame = [self frame];
    
    [_notificationView setFrame:CGRectMake(frame.origin.x, 
                                           frame.origin.y, 
                                           frame.size.width, 
                                           frame.size.height - 15)];
    [_dragHandle setFrame:CGRectMake(frame.origin.x, 
                                     frame.origin.y + frame.size.height - 15, 
                                     frame.size.width, 
                                     15)];
}

@end
