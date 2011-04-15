//
//  CSChannelViewController.h
//  Chatosaurus
//
//  Created by trane on 4/14/11.
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

