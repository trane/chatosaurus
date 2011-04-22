//
//  CSServerViewController.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
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

