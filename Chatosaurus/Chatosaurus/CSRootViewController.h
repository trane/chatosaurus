//
//  CSRootViewController.h
//  Chatosaurus
//
//  Created by Colton Myers on 4/22/11.
//  Copyright 2011 home. All rights reserved.
//

@class CSRootViewController;

@protocol CSRootViewControllerDelegate
@end

@interface CSRootViewController : UIViewController 
{
    NSObject<CSRootViewControllerDelegate>* _delegate;
}

@property (assign) NSObject<CSRootViewControllerDelegate>* delegate;

@end

