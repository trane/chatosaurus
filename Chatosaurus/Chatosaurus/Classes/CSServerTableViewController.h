//
//  CSServerTableViewController.h
//  Chatosaurus
//
//  Created by trane on 4/27/11.
//  Copyright 2011 home. All rights reserved.
//
#import "CSServersCollection.h"
#import "CSChatViewController.h"

@class CSServerTableViewController;

@protocol CSServerTableViewControllerDelegate
- (void) pushChannelView;
@end

@interface CSServerTableViewController : UITableViewController 
{
    NSObject<CSServerTableViewControllerDelegate>* _delegate;
    NSObject<CSChatViewControllerDelegate> *_chatViewDelegate;
    
    NSMutableArray *_serverViews;
    CSServersCollection *_serversCollection;
}

@property (assign) NSObject<CSServerTableViewControllerDelegate>* delegate;

/*!
 * Access to the chat view to create chats
 */
@property (nonatomic,assign) NSObject<CSChatViewControllerDelegate> *chatViewDelegate;

@property (nonatomic,retain) CSServersCollection *serversCollection;
- (void) loadServerViews;

@end

