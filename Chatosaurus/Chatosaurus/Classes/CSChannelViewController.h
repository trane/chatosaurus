//
//  CSChannelViewController.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

@class CSChannelViewController;
#import "CSChannelGridView.h"

@protocol CSChannelViewControllerDelegate
- (void) newMessage:(NSString*)message toChannel:(NSString*)channel;
- (void) createChannelsWithArray:(NSArray*)channels;
@end

@interface CSChannelViewController : UIViewController
{
    NSObject<CSChannelViewControllerDelegate> *_delegate;
    NSObject<ChannelGridViewNotification> *_viewDelegate;
    
    // Set by Preferences plist
    NSUInteger _rowCount;
    NSUInteger _colCount;
    
    NSArray *_channelList;
}

/*!
 * Self's delegate
 */
@property (assign) NSObject<CSChannelViewControllerDelegate> *delegate;

@property (nonatomic,assign) NSObject<ChannelGridViewNotification> *viewDelegate;

/*!
 * Loads the channels provided
 */
- (void) loadChannelList:(NSArray*)channels;

- (void) channelTapped:(id)sender;
@end