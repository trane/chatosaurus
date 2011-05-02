//
//  CSServerViewController.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//
#define ServerViewHeightRatio 2.5f

#import "CSServerViewController.h"
#import "CSChannelViewController.h"

#pragma mark -
#pragma mark Private Interface
@interface CSServerViewController ()
@end

#pragma mark -
@implementation CSServerViewController

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame
{
    self = [super init];
	if (self == nil)
		return self;
    [[self view] setFrame:frame];
    
    // Servers are vertically scrolling
    _scrollView = [[UIScrollView alloc] initWithFrame:frame];
    [_scrollView setBounces:TRUE];
	[_scrollView setAlwaysBounceVertical:TRUE];
    
    _serverViews = [[NSMutableArray alloc] init];
    
    [[self view] addSubview:_scrollView];
    return self;
}

- (void) dealloc 
{
    [self setDelegate:nil];
    [self setViewDelegate:nil];
    
    [_serverViews release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;
@synthesize viewDelegate = _viewDelegate;

@synthesize messageCollection = _messageCollection;
- (void) setMessageCollection:(CSMessageCollection *)messageCollection
{
    _messageCollection = messageCollection;
}

@synthesize serversCollection = _serversCollection;
- (void) setServersCollection:(CSServersCollection *)serversCollection
{
    _serversCollection = serversCollection;
    [self loadServerViews];
}

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

- (void) loadServerViews
{
    NSArray *servers = [_serversCollection servers];
    int rows = 1;

    for (int i = 0; i < [servers count]; i++) {
        NSDictionary *dict = [servers objectAtIndex:i];
        CGSize serverSize = CGSizeZero;
        serverSize.height = 50.0f + 100.0f*rows;
        serverSize.width = [[self view] bounds].size.width;
        // Generate the rect, the plist is sorted in the order the user wants the servers to be
        CGRect rect = CGRectMake([[self view] bounds].origin.x, 
                                 [[self view] bounds].origin.y + serverSize.height * i,
                                 [[self view] bounds].size.width, 
                                 serverSize.height - 10.0f);
        rect = CGRectIntegral(rect);
        CSServerView *serverView = [[[CSServerView alloc] initWithFrame:rect 
                                                              protocol:[dict objectForKey:@"protocol"] 
                                                            serverName:[dict objectForKey:@"serverName"]
                                                                userId:[dict objectForKey:@"userId"]] autorelease];
        [serverView setDelegate:self];
        [_serverViews addObject:serverView];

        // Create the channels array, make sure it is retained.
        NSArray *channels = [[NSArray arrayWithArray:[dict objectForKey:@"channels"]] retain];
        [serverView createChannelsWithArray:channels];
        [_scrollView addSubview:serverView];
    }

}

#pragma mark UIViewController Methods
- (void) viewDidLoad
{
    [[self view] setBackgroundColor:[UIColor whiteColor]];
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return TRUE;
}
- (void) viewDidUnload
{
}

#pragma mark CSServerViewControllerDelegate Methods
- (void) newMessage:(NSString*)message toServer:(NSString*)server channel:(NSString*)channel
{
    
}
- (void) touchedChannel:(NSString*)channel fromServer:(NSString*)server
{

}
@end
