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
@end

@interface CSChatViewController : UIViewController 
{
    NSObject<CSChatViewControllerDelegate>* _delegate;
    CSChatView* _chatView;
}

@property (assign) NSObject<CSChatViewControllerDelegate>* delegate;

@end

