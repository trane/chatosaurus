//
//  CSServerViewController.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//
#import "CSServerView.h"
#import "CSMessageCollection.h"
#import "CSServersCollection.h"

@class CSServerViewController;

@protocol CSServerViewControllerDelegate
@end

@interface CSServerViewController : UIViewController <CSServerViewDelegate>
{
    NSObject<CSServerViewControllerDelegate> *_delegate;
    NSObject<CSServerViewDelegate> *_viewDelegate;
    
    // All servers will be placed in this view
    UIScrollView *_scrollView;
    
    NSMutableArray *_serverViews;
    
    CSMessageCollection *_messageCollection;
    CSServersCollection *_serversCollection;
}

/*!
 * Self's delegate
 */
@property (assign) NSObject<CSServerViewControllerDelegate> *delegate;

/*!
 * Talks to the ServerView
 */
@property (assign) NSObject<CSServerViewDelegate> *viewDelegate;

/*!
 * All messages are stored here
 */
@property (nonatomic,retain) CSMessageCollection *messageCollection;

/*!
 * All server data is accessed from here
 */
@property (nonatomic,retain) CSServersCollection *serversCollection;

/*!
 * Looks through all server views for matching key and reinitializes the view
 *
 * @param key The key of the server
 */
- (void) updateServerViewWithKey:(NSString*)key;

/*!
 * Reads Servers.plist and creates views for each server
 */
- (void) loadServerViews;

@end

