//
//  CSChatViewController.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 home. All rights reserved.
//

@class CSChatViewController;

@protocol CSChatViewControllerDelegate
@end

@interface CSChatViewController : UIViewController 
{
    NSObject<CSChatViewControllerDelegate>* _delegate;
}

@property (assign) NSObject<CSChatViewControllerDelegate>* delegate;

@end

