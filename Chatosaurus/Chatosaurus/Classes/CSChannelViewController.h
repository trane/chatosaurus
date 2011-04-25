//
//  CSChannelViewController.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

@class CSChannelViewController;

@protocol CSChannelViewControllerDelegate
- (void) newMessage:(NSString*)message toChannel:(NSString*)channel;
@end

@interface CSChannelViewController : UIViewController
{
    NSObject<CSChannelViewControllerDelegate> *_delegate;
}

/*!
 * Self's delegate
 */
@property (assign) NSObject<CSChannelViewControllerDelegate> *delegate;

@end

