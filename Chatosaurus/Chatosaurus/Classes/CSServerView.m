//
//  CSServerView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSServerView.h"

#define CSServerViewMargin 2.0f
#define CSServerViewRowCount 2
#define CSServerViewInfoViewPercent 0.4f
#define CSServerViewServerNamePercent 0.75f

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
    _unreadMessageCount = @"100";
    
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

#pragma mark -
#pragma mark Methods

#pragma mark UIView Methods

- (void) layoutSubviews
{
    NSString *fontName = @"Futura";
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
    UIView *serverInfo = [[UIView alloc] initWithFrame:CGRectInset(serverInfoRect, 0, 0)];
//    [serverInfo setBackgroundColor:[UIColor greenColor]];
    
    CGRect unreadMsgRect = CGRectZero; // far left
    CGRect serverNameRect = CGRectZero; // top
    CGRect userIdRect = CGRectZero; // bottom
    CGRect serverInfoButtonRect = CGRectZero; // far right
    
    // Unread message count view
    CGRectDivide(serverInfoRect, &unreadMsgRect, &serverInfoRect, serverInfoRect.size.height, CGRectMinXEdge);
    unreadMsgRect = CGRectInset(unreadMsgRect, 0, 0);
    UILabel *unreadMsgView = [[UILabel alloc] initWithFrame:unreadMsgRect];
    [unreadMsgView setTextAlignment:UITextAlignmentCenter];
    [unreadMsgView setFont:[UIFont fontWithName:fontName size:unreadMsgRect.size.width * 0.5f]];
    [unreadMsgView setText:_unreadMessageCount];
//    [unreadMsgView setBackgroundColor:[UIColor grayColor]];
    [serverInfo addSubview:unreadMsgView];
    
    // Server info button view
    CGRectDivide(serverInfoRect, &serverInfoButtonRect, &serverInfoRect, serverInfoRect.size.height, CGRectMaxXEdge);
    UIButton *serverInfoButton = [[UIView alloc] initWithFrame:CGRectInset(serverInfoButtonRect, 0, 0)];
//    [serverInfoButton setBackgroundColor:[UIColor purpleColor]];
    [serverInfo addSubview:serverInfoButton];
    
    // Server name view
    CGRectDivide(serverInfoRect, &serverNameRect, &serverInfoRect, serverInfoRect.size.height * CSServerViewServerNamePercent, CGRectMinYEdge);
    UILabel *serverNameView = [[UILabel alloc] initWithFrame:CGRectInset(serverNameRect, 0, 0)];
    [serverNameView setFont:[UIFont fontWithName:fontName size:20.0f]];
    [serverNameView setText:_serverName];
//    [serverNameView setBackgroundColor:[UIColor yellowColor]];
    [serverInfo addSubview:serverNameView];
    
    // User id(name)
    CGRectDivide(serverInfoRect, &userIdRect, &serverInfoRect, serverInfoRect.size.height, CGRectMaxYEdge);
    UILabel *userIdView = [[UILabel alloc] initWithFrame:CGRectInset(userIdRect, 0, 0)];
    [userIdView setFont:[UIFont fontWithName:fontName size:9.0f]];
    [userIdView setText:_userId];
//    [userIdView setBackgroundColor:[UIColor blueColor]];
    [serverInfo addSubview:userIdView];
    
    /*
     * Start dividing the channel grid view
     */
    UIView *channelGridView = [[UIView alloc] initWithFrame:channelGridRect];
    [channelGridView setBackgroundColor:[UIColor redColor]];
    
    [self addSubview:serverInfo];
    [self addSubview:channelGridView];
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
