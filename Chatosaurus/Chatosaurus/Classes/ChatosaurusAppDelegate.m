//
//  ChatosaurusAppDelegate.m
//  Chatosaurus
//
//  Created by trane on 4/14/11.
//  Copyright 2011 home. All rights reserved.
//

#import "ChatosaurusAppDelegate.h"

@implementation ChatosaurusAppDelegate

#pragma mark UIApplicationDelegate Methods
- (void) applicationDidFinishLaunching:(UIApplication*)application 
{   
    // Create window and make key
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [_window makeKeyAndVisible];
}

- (void) applicationWillTerminate:(UIApplication*)application
{
    [_window release];
}

- (void) applicationWillResignActive:(UIApplication*)application
{
}

- (void) applicationDidEnterBackground:(UIApplication*)application
{
}

- (void) applicationWillEnterForeground:(UIApplication*)application
{
}

- (void) applicationDidBecomeActive:(UIApplication*)application
{
}

@end
