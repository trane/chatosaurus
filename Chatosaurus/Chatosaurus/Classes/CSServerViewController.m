//
//  CSServerViewController.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSServerViewController.h"

#pragma mark -
#pragma mark Private Interface
@interface CSServerViewController ()
@end

#pragma mark -
@implementation CSServerViewController

#pragma mark Constructors
- (id) init
{
    self = [super init];
	if (self == nil)
		return self;
	
    _serverViews = [[NSMutableArray alloc] init];

    return self;
}

- (void) dealloc 
{
    [self setDelegate:nil];
    [_serverViews release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;

#pragma mark -
#pragma mark Methods
- (void) updateServerViewWithKey:(NSString*)key
{
    for (CSServerView* view in _serverViews) {
        if ([view key] == key) {
            [view setNeedsDisplay];
        }
    }
    
}

#pragma mark UIViewController Methods
- (void) viewDidLoad
{
    [[self view] setBackgroundColor:[UIColor colorWithHue:(float)drand48() saturation:1.0f brightness:1.0f alpha:1.0f]];
}

- (void) viewDidUnload
{
}

@end
