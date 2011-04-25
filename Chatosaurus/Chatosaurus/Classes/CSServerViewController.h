//
//  CSServerViewController.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//
#import "CSServerView.h"
#import "CSMessageCollection.h"

@class CSServerViewController;

@protocol CSServerViewControllerDelegate
@end

@interface CSServerViewController : UIViewController 
{
    NSObject<CSServerViewControllerDelegate>* _delegate;
    
    // All servers will be placed in this view
    UIScrollView *_scrollView;
    
    NSMutableArray *_serverViews;
    
    CSMessageCollection *_messageCollection;
}

@property (assign) NSObject<CSServerViewControllerDelegate>* delegate;

@property (nonatomic,retain) CSMessageCollection *messageCollection;

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

