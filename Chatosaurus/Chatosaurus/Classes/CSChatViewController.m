//
//  CSChatViewController.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChatViewController.h"

#pragma mark -
#pragma mark Private Interface
@interface CSChatViewController () <CSChatViewControllerDelegate>
@end

#pragma mark -
@implementation CSChatViewController

#pragma mark Constructors
- (id) init
{
    self = [super init];
	if (self == nil)
		return self;
    
    _chatViews = [[NSMutableArray alloc] init];
    //[self setDelegate:self];
    return self;
}

- (void) dealloc 
{
    [self setDelegate:nil];
    [_chatViews release];
    [_chatView release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;

#pragma mark -
#pragma mark Methods

#pragma mark CSChatViewControllerDelegate Methods
- (void) createChannel:(NSString*)channel fromServer:(NSString*)server
{

    NSString *identifier = [[NSString alloc] initWithFormat:@"%@,%@",channel,server];
    
    // If view exists, use it -- if not create it and add it to _chatViews
    CSChatView *view = nil;
    if ([_chatViews count] > 0) {
        for (CSChatView *v in _chatViews) {
            if ([[v identifier] isEqualToString:identifier])
                view = v;
        }
    }
    if (view == nil) {
        view = [[[CSChatView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)] autorelease];
        [view setIdentifier:identifier];
        [_chatViews addObject:view];
    }
    
    NSLog(@"Creating channelview: %@", identifier);

    // Do something like this:
//    [_chatView removeFromSuperview];
//    [_chatView release];
    [[self view] addSubview:view];
    [[self view] setNeedsDisplay];
    [self setTitle:channel];
}

#pragma mark UIViewController Methods
- (void) viewDidLoad
{
    [[self view] setBackgroundColor:[UIColor lightGrayColor]];
}

- (void) viewDidUnload
{
}

@end
