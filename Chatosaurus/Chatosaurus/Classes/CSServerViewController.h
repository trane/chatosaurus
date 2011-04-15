//
//  CSServerViewController.h
//  Chatosaurus
//
//  Created by trane on 4/14/11.
//  Copyright 2011 home. All rights reserved.
//

@class CSServerViewController;

@protocol CSServerViewControllerDelegate
@end

@interface CSServerViewController : UIViewController 
{
    NSObject<CSServerViewControllerDelegate>* _delegate;
}

@property (assign) NSObject<CSServerViewControllerDelegate>* delegate;

@end

