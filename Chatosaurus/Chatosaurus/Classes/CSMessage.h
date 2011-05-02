//
//  CSMessage.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

@interface CSMessage : NSObject 
{
    NSString* _serverKey;
    NSString* _messageText;
    NSDate* _timestamp;
}

- (id) initWithServer:(NSString*)server message:(NSString*)message timestamp:(NSString*)timestamp;

@property (nonatomic,readonly) NSString *serverKey;
@property (nonatomic,readonly) NSString *message;
@property (nonatomic,readonly) NSDate *timestamp;

@end
