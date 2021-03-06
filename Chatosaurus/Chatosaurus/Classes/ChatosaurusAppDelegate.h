//
//  ChatosaurusAppDelegate.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//
#import "CSMessageCollection.h"
#import "CSServersCollection.h"
#import "CSServerTableViewController.h"
// All classes that will directly interact with the master app delegate
@class CSServerViewController, CSGlobalPreferencesView, CSNotificationView, CSChatViewController;

@interface ChatosaurusAppDelegate : NSObject <UIApplicationDelegate, CSServerTableViewControllerDelegate> 
{
    UIWindow* _window;
    UINavigationController* _navigation;
    
    // Servers.plist data
    CSServersCollection *_serversCollection;
    
    // Message Collection
    CSMessageCollection *_messageCollection;
    
    // ServerViewController holds all ServerViews
    CSServerViewController *_serverViewController;
    CSServerTableViewController *_serverTableViewController;
    // ChatViewController holds all ChatViews
    CSChatViewController *_chatViewController;
    
    // The global preferences view
    CSGlobalPreferencesView *_globalPreferencesView;
    
    // The notification view
    CSNotificationView *_notificationView;
}

@end
