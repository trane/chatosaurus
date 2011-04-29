//
//  CSServerTableViewCell.h
//  Chatosaurus
//
//  Created by trane on 4/27/11.
//  Copyright 2011 home. All rights reserved.
//
#import "CSServerView.h"

@interface CSServerTableViewCell : UITableViewCell 
{
    CSServerView *_serverView;
}

@property(nonatomic,retain) CSServerView *serverView;
- (void)redisplay;

@end
