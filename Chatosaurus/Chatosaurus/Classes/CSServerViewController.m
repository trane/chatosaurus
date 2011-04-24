//
//  CSServerViewController.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//
#define ServerViewHeightRatio 2.5f

#import "CSServerViewController.h"

#pragma mark -
#pragma mark Private Interface
@interface CSServerViewController ()
@end

#pragma mark -
@implementation CSServerViewController

#pragma mark Constructors
- (id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
	if (self == nil)
		return self;
    
    _serverViews = [self loadServerViews];
    
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

- (NSMutableArray*) loadServerViews
{
    NSString* serversPList = [[NSBundle mainBundle] pathForResource:@"Servers" ofType:@"plist"];
	NSArray *servers = [[NSArray arrayWithArray:[[NSDictionary dictionaryWithContentsOfFile:serversPList] objectForKey:@"Servers"]] autorelease];

    NSMutableArray *serverViews = [[[NSMutableArray alloc] init] retain]    ;
    // Grab all of the values from the plist and create server views
    for (int i = 0; i < [servers count]; i++) {
        NSDictionary *dict = [[servers objectAtIndex:i] autorelease];
        NSString *protocol = [dict objectForKey:@"protocol"];
        NSString *serverName = [dict objectForKey:@"serverName"];
        NSString *userId = [dict objectForKey:@"userId"];
        /*
         * This is if we don't use table view
         * Generate the rect, the plist is sorted in the order the user wants the servers to be
         */
        /*
        CGRect rect = CGRectMake([[self view] bounds].origin.x, [[self view] bounds].origin.y + ([[self view] bounds].size.height * i),
                                 [[self view] bounds].size.width, [[self view] bounds].size.height);
         */
        /*
         * For table view, cell based
         * Generate the same sized rect
         * Height is based on two sections:
         *  section1: The same for all server views, contains base server info
         *  section2: The number of cells in the channel grid
         */
        CGRect rect = CGRectMake(0, 0, [[self tableView] bounds].size.width, [[self tableView] bounds].size.height / ServerViewHeightRatio);
        NSLog(@"%f %f %f %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
        CSServerView *serverView = [[[CSServerView alloc] initWithFrame:rect protocol:protocol serverName:serverName userId:userId] autorelease];
        [serverViews addObject:serverView];
    }
    
    return serverViews;
}

#pragma mark UIViewController Methods
- (void) viewDidLoad
{
    [[self tableView] setBackgroundColor:[UIColor colorWithHue:(float)drand48() saturation:1.0f brightness:1.0f alpha:1.0f]];
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return TRUE;
}
- (void) viewDidUnload
{
}

#pragma mark UITableViewDataSource Methods
- (NSInteger) numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView*)table numberOfRowsInSection:(NSInteger)section
{
    return [_serverViews count];
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    // Grab the server corresponding the this row
    CSServerView *serverView = [_serverViews objectAtIndex:[indexPath row]];
    
    // Get the cell, of it exists
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[serverView key]];

    // If there is no cell with the identifier, create it and append the serverView to the cell
    if (cell == nil) {

        // Initialize a cell
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier:[serverView key]] autorelease];
        [cell setTag:[indexPath row]];
        [cell.contentView addSubview:serverView];
    } else {
        NSLog(@"ELSE");
    }
    return cell;
}


@end
