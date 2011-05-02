//
//  CSServerView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSServerView.h"
#import "CSChannelViewController.h"

#define CSServerViewMargin 5.0f
#define CSServerViewRowCount 2
#define CSServerViewInfoViewPercent 0.4f
#define CSServerViewServerNamePercent 0.75f

#pragma mark -
#pragma mark Private Interface
@interface CSServerView () <CSChannelViewControllerDelegate>
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
    _unreadMessageCount = @"100";
    
    _channelViewController = [[CSChannelViewController alloc] init];
    [_channelViewController setDelegate:self];
    [[_channelViewController view] setFrame:[self bounds]];

	//[self layoutSections];
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
@synthesize channelCount = _channelCount;

- (NSString*) description
{
    return [[[NSString alloc] initWithFormat:@"%@ %@", _serverName, _userId]autorelease];
}
#pragma mark -
#pragma mark Methods

#pragma mark UIView Methods

- (void) layoutSubviews
{
    NSString *fontName = @"Monaco";
//    CGRect infoRect = CGRectMake([self bounds].origin.x, [self bounds].origin.y,
//                                 [self bounds].size.width, [self bounds].size.height / 4.0f);
//    UIView *info = [[UIView alloc] initWithFrame:infoRect];
//
//    // square message box on the left hand side
//    CGRect messageRect = CGRectMake([self bounds].origin.x, [self bounds].origin.y, 
//                                    [info bounds].size.height, [info bounds].size.height);
//    UILabel *message = [[UILabel alloc] initWithFrame:messageRect];
//    [message setFont:[UIFont fontWithName:fontName size:20.0f]];
//    [message setTextAlignment:UITextAlignmentCenter];
//    [message setTextColor:[UIColor grayColor]];
//    [message setText:@"0"];
//    
//    // info button, far left hand
//    CGRect infoButtonRect = CGRectMake(
//                                       [self bounds].size.width - [message bounds].size.width, 
//                                       0,
//                                       [message bounds].size.width,
//                                       [message bounds].size.height);
//    UIButton *infoButton = [[UIButton alloc] initWithFrame:infoButtonRect];
//    [infoButton setBackgroundColor:[UIColor blackColor]];
//    
//    // long rectangle, from end of message to end of view
//    CGRect serverNameRect = CGRectMake([self bounds].origin.x + [message bounds].size.width, 
//                                       [self bounds].origin.y,
//                                       [self bounds].size.width - [message bounds].size.width * 2,
//                                       [info bounds].size.height * 0.75f + 0.5f);
//    UILabel *serverName = [[UILabel alloc] initWithFrame:serverNameRect];
//    [serverName setFont:[UIFont fontWithName:fontName size:16.0]];
//    [serverName setTextAlignment:UITextAlignmentLeft];
//    [serverName setTextColor:[UIColor blackColor]];
//    [serverName setText:_serverName];
//    
//    // username is same size as servername, but just below it
//    CGRect userNameRect = serverNameRect;
//    userNameRect.origin.y = serverNameRect.size.height - 0.5f;
//    userNameRect.size.height = [info bounds].size.height * 0.25f;
//    UILabel *userName = [[UILabel alloc] initWithFrame:userNameRect];
//    [userName setFont:[UIFont fontWithName:fontName size:10.0]];
//    [userName setTextAlignment:UITextAlignmentLeft];
//    [userName setTextColor:[UIColor grayColor]];
//    [userName setText:_userId];
//    
//    // add the subviews
//    [info addSubview:message];
//    [info addSubview:infoButton];
//    [info addSubview:serverName];
//    [info addSubview:userName];
//    
//    // channel view is 3/4, placed below the info view
//    CGRect channelRect = CGRectMake([self bounds].origin.x, infoRect.size.height, 
//                                    [self bounds].size.width, [self bounds].size.height - infoRect.size.height);
//    UIView *channels = [[UIView alloc] initWithFrame:channelRect];
//    [channels setBackgroundColor:[UIColor blueColor]];
//    [channels addSubview:[_channelViewController view]];
//
//    // Append both sections
//    [self addSubview:info];
//    [self addSubview:channels];
    CGRect contentRect = [self bounds];//CGRectInset([self bounds], CSServerViewMargin, CSServerViewMargin);
    CGFloat contentHeight = contentRect.size.height;

    // contains: unread messages, server name, user name and info button
    CGRect serverInfoRect = CGRectZero;
    // contains: the channel grid
    CGRect channelGridRect = CGRectZero;
    
    /*
     CGRect contentRect = CGRectInset([self bounds], CSFileChooserMargin, CSFileChooserMargin);
     CGFloat contentHeight = contentRect.size.height;
     
     CGRect createRegionRect = CGRectZero;
     CGRect selectionRegionRect = CGRectZero;
     CGRect marginRect = CGRectZero;
     
     CGRectDivide(contentRect, &createRegionRect, &contentRect, CSFileChooserCreateRegionPercent * contentHeight, CGRectMinYEdge);
     CGRectDivide(contentRect, &marginRect, &contentRect, CSFileChooserRegionMarginPercent * contentHeight, CGRectMinYEdge);
     CGRectDivide(contentRect, &selectionRegionRect, &contentRect, contentHeight, CGRectMinYEdge);
     */
    
    // Divide view into 1/3 serverinfo, 2/3 channel grid
    CGRectDivide(contentRect, &serverInfoRect, &channelGridRect, contentHeight * CSServerViewInfoViewPercent, CGRectMinYEdge);
    /*
     * Start dividing the server info view
     */
    UIView *serverInfo = [[UIView alloc] initWithFrame:CGRectIntegral(CGRectInset(serverInfoRect, 0, 0))];
//    [serverInfo setBackgroundColor:[UIColor greenColor]];
    
    CGRect unreadMsgRect = CGRectZero; // far left
    CGRect serverNameRect = CGRectZero; // top
    CGRect userIdRect = CGRectZero; // bottom
    CGRect serverInfoButtonRect = CGRectZero; // far right
    
    // Unread message count view
    CGRectDivide(serverInfoRect, &unreadMsgRect, &serverInfoRect, serverInfoRect.size.height, CGRectMinXEdge);
    unreadMsgRect = CGRectIntegral(CGRectInset(unreadMsgRect, 0, 0));
    UILabel *unreadMsgView = [[UILabel alloc] initWithFrame:unreadMsgRect];
    [unreadMsgView setTextAlignment:UITextAlignmentCenter];
    [unreadMsgView setTextColor:[UIColor grayColor]];
    [unreadMsgView setFont:[UIFont fontWithName:fontName size:30.0f]];
    [unreadMsgView setText:_unreadMessageCount];
//    [unreadMsgView setBackgroundColor:[UIColor grayColor]];
    [serverInfo addSubview:unreadMsgView];
    
    // Server info button view
    CGRectDivide(serverInfoRect, &serverInfoButtonRect, &serverInfoRect, serverInfoRect.size.height, CGRectMaxXEdge);
    UIButton *serverInfoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [serverInfoButton setFrame:serverInfoButtonRect];
    [serverInfoButton addTarget:self action:@selector(serverInfoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
//    UIButton *serverInfoButton = [[UIView alloc] initWithFrame:CGRectIntegral(CGRectInset(serverInfoButtonRect, 0, 0))];
//    [serverInfoButton setBackgroundColor:[UIColor purpleColor]];
    [serverInfo addSubview:serverInfoButton];
    
    // Server name view
    CGRectDivide(serverInfoRect, &serverNameRect, &serverInfoRect, serverInfoRect.size.height * CSServerViewServerNamePercent, CGRectMinYEdge);
    serverNameRect = CGRectIntegral(serverNameRect);
    UILabel *serverNameView = [[UILabel alloc] initWithFrame:serverNameRect];//CGRectIntegral(CGRectInset(serverNameRect, 10.0f, 0))];
    [serverNameView setFont:[UIFont fontWithName:fontName size:16.0f]];
    [serverNameView setTextColor:[UIColor grayColor]];
    [serverNameView setText:_serverName];
//    [serverNameView setBackgroundColor:[UIColor yellowColor]];
    [serverInfo addSubview:serverNameView];
    
    // User id(name)
    CGRectDivide(serverInfoRect, &userIdRect, &serverInfoRect, serverInfoRect.size.height, CGRectMaxYEdge);
    userIdRect = CGRectIntegral(userIdRect);
    UILabel *userIdView = [[UILabel alloc] initWithFrame:userIdRect];//CGRectIntegral(CGRectInset(userIdRect, 10.0f, 0))];
    [userIdView setFont:[UIFont fontWithName:fontName size:10.0f]];
    [userIdView setTextColor:[UIColor grayColor]];
    [userIdView setText:_userId];
    [serverInfo addSubview:userIdView];
    
    /*
     * Start dividing the channel grid view
     */
    channelGridRect = CGRectInset(channelGridRect, 0.0f, 1.0f);
    channelGridRect = CGRectIntegral(channelGridRect);
    CSChannelGridView *channelGridView = [[[CSChannelGridView alloc] initWithFrame:channelGridRect] autorelease];
    [[_channelViewController view] setBackgroundColor:[UIColor grayColor]];
    [[_channelViewController view] setFrame:channelGridRect];
    [[_channelViewController view] addSubview:channelGridView];
    [[_channelViewController view] setNeedsLayout];
    [self addSubview:serverInfo];
    [self addSubview:[_channelViewController view]];
}

- (void) serverInfoButtonPressed
{
    //TODO: Create a new view, yo.
}
#pragma mark CSChannelViewControllerDelegate Methods
- (void) newMessage:(NSString *)message toChannel:(NSString *)channel
{
    
}
- (void) touchedChannel:(NSString *)channel
{
    [_delegate touchedChannel:(NSString*)channel fromServer:(NSString*)_serverName];
}

- (void) createChannelsWithArray:(NSArray*)channels
{
    _channelCount = [channels count];
    [_channelViewController loadChannelList:channels];
}
@end
