//
//  CSChatView.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

@protocol CSChatViewDelegate
- (void) keyboardShow;
- (void) keyboardHide;
@end

@interface CSChatView : UIView 
{
    UITextField* _textEntry;
    UITextView* _textView;
    UIButton* _sendButton;
    NSString *_channel;
    NSString *_server;
    NSObject<CSChatViewDelegate> *_delegate;
}

/*!
 * The unique identifier for this chat
 */
@property (nonatomic,retain) NSString *channel;
@property (nonatomic,retain) NSString *server;
- (void) newMessage:(NSString*)message;
@property (nonatomic,assign) NSObject<CSChatViewDelegate> *delegate;

@end
