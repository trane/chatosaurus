//
//  CSMessageCollection.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSMessageCollection.h"

#pragma mark -
#pragma mark Private Interface
@interface CSMessageCollection ()
@end

#pragma mark -
@implementation CSMessageCollection

#pragma mark Constructors
- (id) init
{
    self = [super init];
    if (self == nil)
        return nil;
    
    _origins = [[NSMutableDictionary alloc] init];
    return self;
}

- (void) dealloc
{
    [_origins release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;

@synthesize origins = _origins;
- (void) setOrigins:(NSMutableDictionary *)origins
{
    _origins = origins;
}
#pragma mark -
#pragma mark Methods
- (void) addServers:(NSArray *)servers
{
    for (int i = 0; i < [servers count]; i++) {

        // Grab the server
        NSDictionary *dict = [servers objectAtIndex:i];

        // Get the server name
        NSString *serverName = [dict objectForKey:@"serverName"];
        
        // Create the channel dictionaries
        NSArray *channels = [[NSArray arrayWithArray:[dict objectForKey:@"channels"]] retain];
        NSMutableDictionary *channelNames = [[[NSMutableDictionary alloc] init] autorelease];
        for (int j = 0; j < [channels count]; j++) {
            // Create an empty array to store messages for this channel
            NSMutableArray *channelMessages = [[[NSMutableArray alloc] init] autorelease];            
            [channelNames setValue:channelMessages forKey:[[channels objectAtIndex:j] valueForKey:@"name"]];
        }
        
        // Create the Origins Server->Channels dictionary
        [_origins setValue:channelNames forKey:serverName];
    }
}

- (void) newMessage:(NSString *)message fromChannel:(NSString *)channel server:(NSString *)server
{
    //TODO: This
}
@end
