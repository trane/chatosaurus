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
    
    [self loadServerViews];
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
    NSString *serversPList = [[NSBundle mainBundle] pathForResource:@"Servers" ofType:@"plist"];
	NSArray *servers = [NSArray arrayWithArray:[[NSDictionary dictionaryWithContentsOfFile:serversPList] objectForKey:@"Servers"]];

    // Grab all of the values from the plist and create server views
    NSDictionary *dict = [[[NSDictionary alloc] init] autorelease];
    for (int i = 0; i < [servers count]; i++) {
        dict = [servers objectAtIndex:i];
        
        // Generate the rect, the plist is sorted in the order the user wants the servers to be
        CGRect rect = CGRectMake([[self view] bounds].origin.x, [[self view] bounds].origin.y + (200 * i),
                                 [[self view] bounds].size.width, [[self view] bounds].size.height  / ServerViewHeightRatio);
        
        CSServerView *serverView = [[[CSServerView alloc] initWithFrame:rect 
                                                              protocol:[dict objectForKey:@"protocol"] 
                                                            serverName:[dict objectForKey:@"serverName"]
                                                                userId:[dict objectForKey:@"userId"]] autorelease];
        [_serverViews addObject:serverView];
        [serverView createChannelsWithArray:[dict objectForKey:@"channels"]];
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
@end
