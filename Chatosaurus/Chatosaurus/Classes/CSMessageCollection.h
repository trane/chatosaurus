//
//  CSMessageCollection.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSMessage.h"

@class CSMessageCollection;

/*!
 * Protocol delegate methods (ChatosaurusAppDelegate should implement
 */
@protocol CSMessageCollectionDelegate
- (void) newMessage:(NSString*)message fromChannel:(NSString*)channel server:(NSString*)server;
@end

@interface CSMessageCollection : NSObject 
{
    NSObject<CSMessageCollectionDelegate> *_delegate;

    NSMutableDictionary *_origins;
}

/*!
 * Getter for this delegate
 */
@property (nonatomic,assign) NSObject<CSMessageCollectionDelegate> *delegate;

@property (nonatomic,assign) NSMutableDictionary *origins;

/*!
 * This will populate the origins dictionary with a:
 * Servers dictionary that contains a dictionary of channels of that server
 * Each channel dictionary contains an empty array that will be populated
 * with incoming messages to that array
 */
- (void) addServers:(NSArray*)servers;

/**
 * Communicates new messages to the user
 */
- (void) newMessage:(NSString*)message fromChannel:(NSString*)channel server:(NSString*)server;

@end
