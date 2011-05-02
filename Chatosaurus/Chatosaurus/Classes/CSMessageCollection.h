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
 * Protocol delegate methods (ChatosaurusAppDelegate should implement)
 */
@protocol CSMessageCollectionDelegate

@end

@interface CSMessageCollection : NSObject 
{
    NSObject<CSMessageCollectionDelegate> *_delegate;
    
    NSMutableArray *_organizedMessageCollection;
    NSMutableArray *_rawMessageCollection;
}

/*!
 * Getter for this delegate
 */
@property (nonatomic,assign) NSObject<CSMessageCollectionDelegate> *delegate;

- (NSArray*) messagesForServer:(NSString*)server channel:(NSString*)channel;
- (NSArray*) messagesSortedByTime;

@end
