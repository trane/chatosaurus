//
//  CSChannelViewController.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 home. All rights reserved.
//

@class CSChannelViewController;

@protocol CSChannelViewControllerDelegate
@end

@interface CSChannelViewController : UIViewController 
{
    NSObject<CSChannelViewControllerDelegate>* _delegate;
}

@property (assign) NSObject<CSChannelViewControllerDelegate>* delegate;

@end

