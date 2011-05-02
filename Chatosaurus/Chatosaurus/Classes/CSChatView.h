//
//  CSChatView.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

@interface CSChatView : UIView 
{
    UITextField* _textEntry;
    UITextView* _textView;
    UIButton* _sendButton;
    NSString *_channel;
    NSString *_server;
}

/*!
 * The unique identifier for this chat
 */
@property (nonatomic,retain) NSString *channel;
@property (nonatomic,retain) NSString *server;
- (void) newMessage:(NSString*)message;

@end
