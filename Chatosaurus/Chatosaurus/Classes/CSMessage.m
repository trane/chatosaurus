//
//  CSMessage.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSMessage.h"

#pragma mark -
#pragma mark Private Interface
@interface CSMessage ()
@end

#pragma mark -
@implementation CSMessage

#pragma mark Constructors
- (id) initWithServer:(NSString *)server message:(NSString *)message timestamp:(NSString *)timestamp
{
    self = [super init];
    if (self == nil)
        return nil;
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
    [_serverKey release];
    [_messageText release];
    [_timestamp release];
}

#pragma mark -
#pragma mark Accessors

@synthesize serverKey=_serverKey;
@synthesize message=_messageText;
@synthesize timestamp=_timestamp;

#pragma mark -
#pragma mark Methods

@end
