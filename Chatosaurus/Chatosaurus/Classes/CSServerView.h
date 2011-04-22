//
//  CSServerView.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

@interface CSServerView : UIView 
{
    NSString* _key;
}

/*!
 * Provides the unique id for this server
 * Example: irc_server
 *          msn_id
 *          jabber_id
 */
@property (nonatomic,assign) NSString* key;

@end
