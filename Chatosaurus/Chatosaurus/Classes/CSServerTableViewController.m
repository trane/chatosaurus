//
//  CSServerTableViewController.m
//  Chatosaurus
//
//  Created by trane on 4/27/11.
//  Copyright 2011 home. All rights reserved.
//

#import "CSServerTableViewController.h"
#import "CSServerTableViewCell.h"
#import "CSChatViewController.h"

#pragma mark -
#pragma mark Private Interface
@interface CSServerTableViewController () <UITableViewDataSource, CSServerViewDelegate>
@end

#pragma mark -
@implementation CSServerTableViewController

#pragma mark Constructors
- (id) init
{
    self = [super init];
	if (self == nil)
		return self;
    [self setTitle:@"Servers"];
    [[self tableView] setRowHeight:200.0f];
    [[self tableView] setAllowsSelection:FALSE];
    _serverViews = [[NSMutableArray alloc] init];
    [self loadServerViews];
    return self;
}
- (id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self == nil)
        return self;
    [self setTitle:@"Servers"];
    [[self tableView] setRowHeight:150.0f];
    
    _serverViews = [[NSMutableArray alloc] init];
    //[self loadServerViews];
    return self;
    
}
- (void) dealloc 
{
    [self setDelegate:nil];
    [_serverViews release];
    [_serversCollection release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;
@synthesize serversCollection = _serversCollection;
- (void) setServersCollection:(CSServersCollection *)serversCollection
{
    _serversCollection = serversCollection;
    [self loadServerViews];
    [[self tableView] reloadData];
}
@synthesize chatViewDelegate = _chatViewDelegate;
- (void) setChatViewDelegate:(NSObject<CSChatViewControllerDelegate> *)chatViewDelegate
{
    _chatViewDelegate = chatViewDelegate;
}
#pragma mark -
#pragma mark Methods

#pragma mark UIViewController Methods
- (void) viewDidLoad
{
    //[[self view] setBackgroundColor:[UIColor colorWithHue:(float)drand48() saturation:1.0f brightness:1.0f alpha:1.0f]];
    [[self navigationController] setNavigationBarHidden:TRUE animated:FALSE];
}

- (void) viewDidUnload
{
}
- (void) loadServerViews
{
    NSArray *servers = [_serversCollection servers];
    // Grab all of the values from the plist and create server views
    for (int i = 0; i < [servers count]; i++) {
        NSDictionary *dict = [[servers objectAtIndex:i] retain];
        CGSize serverSize = CGSizeZero;
        serverSize.height = 50.0f + 100.0f;
        serverSize.width = [[self view] bounds].size.width;
        // Generate the rect, the plist is sorted in the order the user wants the servers to be
        CGRect rect = CGRectMake(10, 
                                 10,// + serverSize.height * i,
                                 300.0f, 
                                 140.0f);
        rect = CGRectInset(rect, 4, 0);
        rect = CGRectIntegral(rect);
        CSServerView *serverView = [[[CSServerView alloc] initWithFrame:rect 
                                                               protocol:[dict objectForKey:@"protocol"] 
                                                             serverName:[dict objectForKey:@"serverName"]
                                                                 userId:[dict objectForKey:@"userId"]] retain];
        //serverView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [serverView setDelegate:self];
        [_serverViews addObject:serverView];
        
        // Create the channels array, make sure it is retained.
        NSArray *channels = [[NSArray arrayWithArray:[dict objectForKey:@"channels"]] retain];
        [serverView createChannelsWithArray:channels];
    }
    [[self tableView] reloadData];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return [_serverViews count];
}

- (NSInteger) tableView:(UITableView*)table numberOfRowsInSection:(NSInteger)section
{
    return 1;//[_serverViews count];
}

- (void) viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:TRUE animated:TRUE];
}

#pragma mark UITableViewController Methods
- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSString *identity = [[_serverViews objectAtIndex:[indexPath section]] serverName];
    
    CSServerTableViewCell *cell = (CSServerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[[CSServerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity] autorelease];
        [[cell contentView] setFrame:CGRectMake(0.0, 0.0, 320.0f, 200.0f)];
        [[cell contentView] addSubview:[_serverViews objectAtIndex:[indexPath section]]];
    }
    return cell;
}

#pragma mark CSServerTableViewControllerDelegate Methods
- (void) newMessage:(NSString*)message toServer:(NSString*)server channel:(NSString*)channel
{
    
}
- (void) touchedChannel:(NSString*)channel fromServer:(NSString*)server
{
    //[[self navigationController] viewWillDisappear:YES];
    [_chatViewDelegate createChannel:channel fromServer:server];
    [_delegate pushChannelView];
}


#pragma mark UINavigationControllerDelegate Methods

// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"Will show viewcontroller");
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

@end
