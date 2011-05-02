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
    [_channelList release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;
@synthesize viewDelegate = _viewDelegate;
- (CSChannelGridView*) channelView
{
	return (CSChannelGridView*)[self view];
}
#pragma mark -
#pragma mark Methods
- (void) loadChannelList:(NSArray*)channels
{
    _channelList = channels;
    [[self view] setNeedsLayout];
}

#pragma mark UIViewController Methods
- (void) loadView
{
    CSChannelGridView *channelView = [[[CSChannelGridView alloc] init] autorelease];
    [channelView setNotify:self];
    [channelView setVisibleCols:_colCount];
    [channelView setVisibleRows:_rowCount];
    [self setView:channelView];
}
- (void) viewDidLoad
{
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
    NSInteger count = [_channelList count];
    return count / _rowCount + (count % _rowCount == 0 ? 0 : 1);
}

- (CSChannelView*) channelGridView:(CSChannelGridView*)gridView viewCellAtRow:(NSInteger)row column:(NSInteger)col
{
    //NSArray *temp = [NSArray arrayWithArray:_channelList];
    NSInteger channelNum = _rowCount * col + row;
    if (channelNum >= [_channelList count])
        return nil;
    NSDictionary *dict = [_channelList objectAtIndex:channelNum];
    CSChannelView *channelView = [[[CSChannelView alloc] init] autorelease];
    [channelView setName:[dict objectForKey:@"name"]];
    [channelView setTapTarget:self];
    [channelView setTapAction:@selector(channelTapped:)];
    
//    NSString *avatarPathString = [dict objectForKey:@"avatar"];
    
//    if (avatarPathString == nil)
//    [channelView setAvatar:[dict objectForKey:@"photo"]];
    
    return channelView;
}

- (void) channelTapped:(id)sender
{
    
}

@end
