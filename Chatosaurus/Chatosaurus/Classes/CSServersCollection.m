//
//  CSServersCollection.m
//  Chatosaurus
//
//  Created by trane on 5/1/11.
//  Copyright 2011 home. All rights reserved.
//

#import "CSServersCollection.h"

#pragma mark -
#pragma mark Private Interface
@interface CSServersCollection ()
@end

#pragma mark -
@implementation CSServersCollection

#pragma mark Constructors
- (id) init
{
    self = [super init];
    if (self == nil)
        return nil;
    
    NSString *serversPList = [[NSBundle mainBundle] pathForResource:@"Servers" ofType:@"plist"];
    _servers = [NSArray arrayWithArray:[[NSDictionary dictionaryWithContentsOfFile:serversPList] objectForKey:@"Servers"]];
    
    return self;
}

- (void) dealloc
{
    [_servers release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize servers = _servers;
- (NSArray*) servers
{
    return [NSArray arrayWithArray:_servers];
}

@synthesize messageCollection = _messageCollection;
- (void) setMessageCollection:(CSMessageCollection *)messageCollection
{    
    _messageCollection = messageCollection;
    NSArray *servers = [NSArray arrayWithArray:_servers];
    [_messageCollection addServers:servers];
}

#pragma mark -
#pragma mark Methods

@end
