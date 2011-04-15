//
//  ChatosaurusAppDelegate.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 home. All rights reserved.
//
#import "CSMessageCollection.h"

// All classes that will directly interact with the master app delegate
@class CSServerViewController, CSGlobalPreferencesView, CSNotificationView, CSChatViewController;

@interface ChatosaurusAppDelegate : NSObject <UIApplicationDelegate, CSMessageCollectionDelegate> 
{
    UIWindow* _window;
    
    // ServerViewController holds all ServerViews
    CSServerViewController *_serverViewController;

    // ChatViewController holds all ChatViews
    CSChatViewController *_chatViewController;
    
    // The global preferences view
    CSGlobalPreferencesView *_globalPreferencesView;
    
    // The notification view
    CSNotificationView *_notificationView;
}

@end
