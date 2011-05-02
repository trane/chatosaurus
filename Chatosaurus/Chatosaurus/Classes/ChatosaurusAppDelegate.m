//
//  ChatosaurusAppDelegate.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "ChatosaurusAppDelegate.h"
#import "CSServerViewController.h"
#import "CSServerTableViewController.h"
#import "CSChatViewController.h"

@implementation ChatosaurusAppDelegate

#pragma mark UIApplicationDelegate Methods
- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Read in the plists
    _serversCollection = [[CSServersCollection alloc] init];
    
//    _serverViewController = [[CSServerViewController alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    _serverTableViewController = [[CSServerTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [_serverTableViewController setServersCollection:_serversCollection];
    
    _chatViewController = [[CSChatViewController alloc] init];

//    _navigation = [[UINavigationController alloc]
//                   initWithRootViewController:chatViewController];
    _navigation = [[UINavigationController alloc]
                   initWithRootViewController:_serverTableViewController];
    [[_navigation view] setFrame:[[UIScreen mainScreen] applicationFrame]];
    [_navigation setNavigationBarHidden:TRUE animated:TRUE];
    [_window addSubview:[_navigation view]];

    [_window makeKeyAndVisible];

    NSLog(@"placeholder");
}

- (void) applicationWillTerminate:(UIApplication*)application
{
    [_chatViewController release];
    [_serverViewController release];
    [_navigation release];
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
