//
//  ChatosaurusAppDelegate.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "ChatosaurusAppDelegate.h"
#import "CSServerViewController.h"

@implementation ChatosaurusAppDelegate

#pragma mark UIApplicationDelegate Methods
- (void) applicationDidFinishLaunching:(UIApplication*)application 
{   
    // Create window and make key
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [_window makeKeyAndVisible];
    
    _serverViewController = [[CSServerViewController alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];

    _navigation = [[UINavigationController alloc]
                   initWithRootViewController:_serverViewController];
	[[_navigation view] setFrame:[[UIScreen mainScreen] applicationFrame]];
    [_navigation setNavigationBarHidden:TRUE animated:TRUE];
	[_window addSubview:[_navigation view]];
    
    NSLog(@"placeholder");
}

- (void) applicationWillTerminate:(UIApplication*)application
{
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
