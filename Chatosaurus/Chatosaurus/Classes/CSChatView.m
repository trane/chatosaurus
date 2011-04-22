//
//  CSChatView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChatView.h"

#pragma mark -
#pragma mark Private Interface
@interface CSChatView ()
@end

#pragma mark -
@implementation CSChatView

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
	if (self == nil)
		return nil;
	
    return self;
}

- (void) dealloc 
{
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark Methods

#pragma mark UIView Methods
- (void) layoutSubviews
{
}

@end
