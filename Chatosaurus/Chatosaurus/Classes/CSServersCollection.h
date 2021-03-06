//
//  CSServersCollection.h
//  Chatosaurus
//
//  Created by trane on 5/1/11.
//  Copyright 2011 home. All rights reserved.
//
#import "CSMessageCollection.h"

@interface CSServersCollection : NSObject 
{
    NSMutableArray *_servers;
    CSMessageCollection *_messageCollection;
}

/*!
 * Returns an array of servers from the Server.plist resource
 */
@property (nonatomic,readonly) NSArray *servers;

@property (nonatomic,retain) CSMessageCollection *messageCollection;

@end
