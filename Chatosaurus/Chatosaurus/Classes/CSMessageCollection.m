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
    
    _organizedMessageCollection = [[NSMutableArray alloc] init];
    _rawMessageCollection = [[NSMutableArray alloc] init];
    
    return self;
}

- (void) dealloc
{
    [_organizedMessageCollection release];
    [_rawMessageCollection release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize delegate = _delegate;

- (NSArray*) messagesForServer:(NSString*)server channel:(NSString*)channel
{
    //TODO: implement
    return nil;
}

- (NSArray*) messagesSortedByTime
{
    //TODO: implement
    return nil;
}

#pragma mark -
#pragma mark Methods

@end
