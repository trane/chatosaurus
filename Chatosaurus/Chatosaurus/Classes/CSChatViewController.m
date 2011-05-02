//
//  CSChatViewController.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChatViewController.h"

#pragma mark -
#pragma mark Private Interface
@interface CSChatViewController () <CSChatViewControllerDelegate>
@end

#pragma mark -
@implementation CSChatViewController

#pragma mark Constructors
- (id) init
{
    self = [super init];
	if (self == nil)
		return self;
    
    _chatViews = [[NSMutableArray alloc] init];
    return self;
}

- (void) dealloc 
{
    [self setDelegate:nil];
    [_chatViews release];
    [_chatView release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;
@synthesize messageCollectionDelegate = _messageCollectionDelegate;

#pragma mark -
#pragma mark Methods

#pragma mark CSChatViewControllerDelegate Methods
- (void) createChannel:(NSString*)channel fromServer:(NSString*)server
{
    if (_notificationView == nil)
        _notificationView = [[CSNotificationView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    else
        [_notificationView removeFromSuperview];

    //NSString *identifier = [[NSString alloc] initWithFormat:@"%@,%@",channel,server];
    // If view exists, use it -- if not create it and add it to _chatViews
    CSChatView *view = nil;
    if ([_chatViews count] > 0) {
        for (CSChatView *v in _chatViews) {
            if ([[v channel] isEqualToString:channel] && [[v server] isEqualToString:server])
                view = v;
        }
    }
    if (view == nil) {
        view = [[[CSChatView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)] autorelease];
        NSLog(@"Creating channelview: %@ %@", channel, server);

        [view setChannel:channel];
        [view setServer:server];
        [view setDelegate:_notificationView];
        [_chatViews addObject:view];
    }
    
    
   

    // Do something like this:
//    [_chatView removeFromSuperview];
//    [_chatView release];
    [[self view] addSubview:view];
    [[self view] addSubview:_notificationView];
    [[self view] setNeedsDisplay];
    [self setTitle:channel];
}

#pragma mark UIViewController Methods
- (void) viewDidLoad
{
    [[self view] setBackgroundColor:[UIColor lightGrayColor]];
}

- (void) viewDidUnload
{
}

- (void) viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:FALSE animated:TRUE];
}

- (void) newMessage:(NSString *)message fromChannel:(NSString *)channel server:(NSString *)server
{
    for (CSChatView *view in _chatViews) {
        if ([[view channel] isEqualToString:channel] && [[view server] isEqualToString:server])
            [view newMessage:message];
    }
}
@end
