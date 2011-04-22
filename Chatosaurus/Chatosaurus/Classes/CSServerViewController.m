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
- (id) init:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

#pragma mark UIViewController Methods
- (void) viewDidLoad
{
    [[self view] setBackgroundColor:[UIColor colorWithHue:(float)drand48() saturation:1.0f brightness:1.0f alpha:1.0f]];
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
        
        [cell.contentView addSubview:serverView];
    }

    return cell;
}


@end
