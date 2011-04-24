//
//  CSServerView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSServerView.h"

#pragma mark -
#pragma mark Private Interface
@interface CSServerView ()
@end

#pragma mark -
@implementation CSServerView

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame
            protocol:(NSString*)protocol
          serverName:(NSString*)serverName
              userId:(NSString*)userId
{
    self = [super initWithFrame:frame];
	if (self == nil)
		return nil;
    
    _serverName = serverName;
    _userId = userId;
    _protocol = protocol;
    _key = [[NSString alloc] initWithFormat:@"%s_%s_%s", 
             protocol, serverName, userId];
	
    return self;
}

- (void) dealloc 
{
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize key = _key;
@synthesize serverName = _serverName;
@synthesize userId = _userId; // andrew.kuhnhausenATgmail.com
@synthesize channelViewController = _channelViewController;
@synthesize protocol = _protocol;
#pragma mark -
#pragma mark Methods

#pragma mark UIView Methods
- (void) layoutSubviews
{
}

@end
