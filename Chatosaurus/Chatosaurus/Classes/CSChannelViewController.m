//
//  CSChannelViewController.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChannelViewController.h"
#import "CSChannelGridView.h"
#import "CSChannelView.h"

#pragma mark -
#pragma mark Private Interface
@interface CSChannelViewController () <ChannelGridViewNotification>
@end

#pragma mark -
@implementation CSChannelViewController

#pragma mark Constructors
- (id) init
{
    self = [super init];
	if (self == nil)
		return self;
	
    // TODO: Get these by plist
    _rowCount = 1;
    _colCount = 4;
        
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
@synthesize viewDelegate = _viewDelegate;

#pragma mark -
#pragma mark Methods
- (void) loadChannelList:(NSArray*)channels
{
    _channelList = channels;
    [[self view] setNeedsDisplay];
}

#pragma mark UIViewController Methods
- (void) loadView
{
    CSChannelGridView *channelView = [[[CSChannelGridView alloc] init] autorelease];
    [channelView setBackgroundColor:[UIColor greenColor]];
    [self setView:channelView];
}
- (void) viewDidLoad
{
    [[self view] setBackgroundColor:[UIColor colorWithHue:(float)drand48() saturation:1.0f brightness:1.0f alpha:1.0f]];
}

- (void) viewDidUnload
{
}


#pragma mark ChannelGridViewNotification Methods
- (NSUInteger) channelRowCount:(CSChannelGridView*)gridView
{
    return _rowCount;
}
- (NSUInteger) channelColumnCount:(CSChannelGridView*)gridView
{
    return _colCount;
}

- (CSChannelView*) channelGridView:(CSChannelGridView*)gridView viewCellAtRow:(NSInteger)row column:(NSInteger)col
{
    return nil;
}
@end
