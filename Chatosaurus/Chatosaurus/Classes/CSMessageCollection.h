//
//  CSMessageCollection.h
//  Chatosaurus
//
//  Created by trane on 4/14/11.
//  Copyright 2011 home. All rights reserved.
//

#import "CSMessage.h"

@class CSMessageCollection;

/*!
 * Protocol delegate methods (ChatosaurusAppDelegate should implement
 */
@protocol CSMessageCollectionDelegate

@end

@interface CSMessageCollection : NSObject 
{
    NSObject<CSMessageCollectionDelegate> *_delegate;
}

/*!
 * Getter for this delegate
 */
@property (nonatomic,assign) NSObject<CSMessageCollectionDelegate> *delegate;

@end