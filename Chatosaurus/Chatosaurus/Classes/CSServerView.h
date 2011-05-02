//
//  CSServerView.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//
#import "CSChannelViewController.h"

@protocol CSServerViewDelegate
- (void) newMessage:(NSString*)message toServer:(NSString*)server channel:(NSString*)channel;
- (void) touchedChannel:(NSString*)channel fromServer:(NSString*)server;
@end

@interface CSServerView : UIView <CSChannelViewControllerDelegate>
{
    NSObject<CSChannelViewControllerDelegate> *_channelDelegate;
    NSObject<CSServerViewDelegate> *_delegate;
    
    NSString *_key; // jabber_andrew.kuhnhausen@gmail.com
    NSString *_serverName; // google talk
    NSString *_userId; // andrew.kuhnhausen@gmail.com
    NSString *_protocol; // irc, jabber, msn, aol
    NSString *_unreadMessageCount;
    NSInteger _channelCount;
    CSChannelViewController *_channelViewController;
}

/*!
 * Default constructor
 *
 * @param frame The view's frame
 * @param protocol irc, msn, jabber, googletalk
 * @param serverName IRC server's name or protocol name if not irc
 * @param userId The IRC nick or user id if not irc
 *
 * @return self
 */
- (id) initWithFrame:(CGRect)frame 
            protocol:(NSString*)protocol
          serverName:(NSString*)serverName
              userId:(NSString*)userId;
/*!
 * Talks to the ChannelViewController
 */
@property (assign) NSObject<CSChannelViewControllerDelegate> *channelDelegate;

/*!
 * Self's delegate
 */
@property (assign) NSObject<CSServerViewDelegate> *delegate;

/*!
 * Provides the unique id for this server
 * Example: irc_server_nick
 *          msn_msn.microsoft.com_id
 *          jabber_talk.google.com_id
 */
@property (nonatomic,retain) NSString *key;

/*!
 * The name of the server, e.g. Google Talk, Quakenet
 */
@property (nonatomic,retain) NSString *serverName;

/*!
 * The user id or nick, e.g. andrew.kuhnhausen@gmail.com or trane
 */
@property (nonatomic,retain) NSString *userId;

/*!
 * Corresponds to the protocol type
 * eg, jabber, irc, aol, msn
 */
@property (nonatomic,assign) NSString *protocol;

@property (nonatomic,assign) NSInteger channelCount;
/*!
 * This holds the views of channels
 */
@property (nonatomic,retain) CSChannelViewController *channelViewController;

@end
