//
//  CSRootViewController.m
//  Chatosaurus
//
//  Created by Colton Myers on 4/22/11.
//  Copyright 2011 home. All rights reserved.
//

#import "CSRootViewController.h"

#pragma mark -
#pragma mark Private Interface
@interface CSRootViewController ()
@end

#pragma mark -
@implementation CSRootViewController

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
    [[self view] setBackgroundColor:[UIColor colorWithHue:(float)drand48() saturation:1.0f brightness:1.0f alpha:1.0f]];
}

- (void) viewDidUnload
{
}

@end
