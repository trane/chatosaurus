//
//  CSChatViewController.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChatView.h"

@class CSChatViewController;

@protocol CSChatViewControllerDelegate
- (void) createChannel:(NSString*)channel fromServer:(NSString*)server;
@end

@interface CSChatViewController : UIViewController 
{
    NSObject<CSChatViewControllerDelegate>* _delegate;
    CSChatView* _chatView;
    
    NSMutableArray *_chatViews;
}

@property (assign) NSObject<CSChatViewControllerDelegate>* delegate;

@end

