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
    
    NSMutableArray *_serverViews;

}

@property (assign) NSObject<CSServerViewControllerDelegate>* delegate;

/*!
 * Looks through all server views for matching key and reinitializes the view
 *
 * @param key The key of the server
 */
- (void) updateServerView:(CSServerView*)serverView withKey:(NSString*)key;

@end

