//
//  CSNotificationView.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChatView.h"

@interface CSNotificationView : UIView <CSChatViewDelegate, UITableViewDataSource>
{
    UIView *_dragHandle;
    UITableView *_notificationView;
    
    BOOL _dragging;
    int _prevHeight;
    
    NSArray *_messages;
}

@end
