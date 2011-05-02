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
@interface CSChatViewController ()
@end

#pragma mark -
@implementation CSChatViewController

#pragma mark Constructors
- (id) init
{
    self = [super init];
	if (self == nil)
		return self;
    
    return self;
}

- (void) dealloc 
{
    [self setDelegate:nil];
    
    [_chatView release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;

#pragma mark -
#pragma mark Methods

#pragma mark UIViewController Methods
- (void) viewDidLoad
{
    [[self view] setBackgroundColor:[UIColor lightGrayColor]];
    
    _chatView = [[CSChatView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    [[self view] addSubview:_chatView];
    
    [[self navigationController] setNavigationBarHidden:FALSE animated:TRUE];
}

- (void) viewDidUnload
{
}

@end
