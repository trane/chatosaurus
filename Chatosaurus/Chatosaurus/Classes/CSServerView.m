//
//  CSServerView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSServerView.h"

#pragma mark -
#pragma mark Private Interface
@interface CSServerView ()
@end

#pragma mark -
@implementation CSServerView

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame
            protocol:(NSString*)protocol
          serverName:(NSString*)serverName
              userId:(NSString*)userId
{
    self = [super initWithFrame:frame];
	if (self == nil)
		return nil;
    
    _serverName = serverName;
    _userId = userId;
    _protocol = protocol;
    _key = [[NSString alloc] initWithFormat:@"%s_%s_%s", 
             protocol, serverName, userId];
	[self layoutSections];
    return self;
}

- (void) dealloc 
{
    [self setDelegate:nil];
    [self setChannelDelegate:nil];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;
@synthesize channelDelegate = _channelDelegate;

@synthesize key = _key;
@synthesize serverName = _serverName;
@synthesize userId = _userId; // andrew.kuhnhausenATgmail.com
@synthesize channelViewController = _channelViewController;
@synthesize protocol = _protocol;

#pragma mark -
#pragma mark Methods
- (void) layoutSections
{
    NSString *fontName = @"Arial";
    CGRect infoRect = CGRectMake([self bounds].origin.x, [self bounds].origin.y,
                                 [self bounds].size.width, [self bounds].size.height / 4.0f);
    UIView *info = [[UIView alloc] initWithFrame:infoRect];

    // square message box on the left hand side
    CGRect messageRect = CGRectMake([self bounds].origin.x, [self bounds].origin.y, 
                                    [info bounds].size.height, [info bounds].size.height);
    UILabel *message = [[UILabel alloc] initWithFrame:messageRect];
    [message setFont:[UIFont fontWithName:fontName size:20.0f]];
    [message setTextAlignment:UITextAlignmentCenter];
    [message setTextColor:[UIColor grayColor]];
    [message setText:@"0"];
    
    // info button, far left hand
    CGRect infoButtonRect = CGRectMake(
                                       [self bounds].size.width - [message bounds].size.width, 
                                       0,
                                       [message bounds].size.width,
                                       [message bounds].size.height);
    UIButton *infoButton = [[UIButton alloc] initWithFrame:infoButtonRect];
    [infoButton setBackgroundColor:[UIColor blackColor]];
    
    // long rectangle, from end of message to end of view
    CGRect serverNameRect = CGRectMake([self bounds].origin.x + [message bounds].size.width, 
                                       [self bounds].origin.y,
                                       [self bounds].size.width - [message bounds].size.width * 2,
                                       [info bounds].size.height * 0.75f + 0.5f);
    UILabel *serverName = [[UILabel alloc] initWithFrame:serverNameRect];
    [serverName setFont:[UIFont fontWithName:fontName size:16.0]];
    [serverName setTextAlignment:UITextAlignmentLeft];
    [serverName setTextColor:[UIColor blackColor]];
    [serverName setText:_serverName];
    
    // username is same size as servername, but just below it
    CGRect userNameRect = serverNameRect;
    userNameRect.origin.y = serverNameRect.size.height - 0.5f;
    userNameRect.size.height = [info bounds].size.height * 0.25f;
    UILabel *userName = [[UILabel alloc] initWithFrame:userNameRect];
    [userName setFont:[UIFont fontWithName:fontName size:10.0]];
    [userName setTextAlignment:UITextAlignmentLeft];
    [userName setTextColor:[UIColor grayColor]];
    [userName setText:_userId];
    
    // add the subviews
    [info addSubview:message];
    [info addSubview:infoButton];
    [info addSubview:serverName];
    [info addSubview:userName];
    
    // channel view is 3/4, placed below the info view
    CGRect channelRect = CGRectMake([self bounds].origin.x, infoRect.size.height, 
                                    [self bounds].size.width, [self bounds].size.height - infoRect.size.height);
    UIView *channels = [[UIView alloc] initWithFrame:channelRect];
    [channels setBackgroundColor:[UIColor blueColor]];
    [channels addSubview:[_channelViewController view]];

    // Append both sections
    [self addSubview:info];
    [self addSubview:channels];
}

#pragma mark UIView Methods
- (void) layoutSubviews
{
}

#pragma mark CSChannelViewControllerDelegate Methods
- (void) newMessage:(NSString *)message toChannel:(NSString *)channel
{
    
}

- (void) createChannelsWithArray:(NSArray*)channels
{
    [_channelViewController loadChannelList:channels];
}
@end
