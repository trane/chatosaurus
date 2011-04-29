//
//  CSServerTableViewController.h
//  Chatosaurus
//
//  Created by trane on 4/27/11.
//  Copyright 2011 home. All rights reserved.
//

@class CSServerTableViewController;

@protocol CSServerTableViewControllerDelegate
@end

@interface CSServerTableViewController : UITableViewController 
{
    NSObject<CSServerTableViewControllerDelegate>* _delegate;
    NSMutableArray *_serverViews;

}

@property (assign) NSObject<CSServerTableViewControllerDelegate>* delegate;
- (void) loadServerViews;

@end

