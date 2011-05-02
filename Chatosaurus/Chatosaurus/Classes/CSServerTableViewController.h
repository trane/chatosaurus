//
//  CSServerTableViewController.h
//  Chatosaurus
//
//  Created by trane on 4/27/11.
//  Copyright 2011 home. All rights reserved.
//
#import "CSServersCollection.h"

@class CSServerTableViewController;

@protocol CSServerTableViewControllerDelegate
@end

@interface CSServerTableViewController : UITableViewController 
{
    NSObject<CSServerTableViewControllerDelegate>* _delegate;
    NSMutableArray *_serverViews;
    CSServersCollection *_serversCollection;
}

@property (assign) NSObject<CSServerTableViewControllerDelegate>* delegate;
@property (nonatomic,retain) CSServersCollection *serversCollection;
- (void) loadServerViews;

@end

