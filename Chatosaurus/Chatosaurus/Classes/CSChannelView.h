//
//  CSChannelView.h
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//
@class CSChannelView;

@interface CSChannelView : UIView 
{
    // Label of the contact or channel
    UILabel *_name;
    
    // When clicked, launches chat
    UIButton *_chatButton;

    // Contains channel avatar (if not in IRC)
    UIImageView *_avatarView;
    
    // If in IRC mode, use text
    UITextView *_textView;
    
    id _tapTarget;
    SEL _tapAction;
    id _userInfo;
}

/*!
 * Default constructor, if in IRC, this is false
 */
- (id) initWithFrame:(CGRect)frame name:(NSString*)name avatar:(UIImage*)avatar;

/*!
 * The contact name, or channel name depending on protocol
 */
@property (nonatomic,copy) NSString *name;

/*!
 * I can't believe I'm saying 'avatar' here, wtf?
 */
@property (nonatomic,retain) UIImage *avatar;

/*!
 * Text is displayed if in IRC mode
 */
@property (nonatomic,retain) NSString *text;

/*!
 * For determining if this view was touched
 */
@property (nonatomic,retain) id tapTarget;

/*!
 * Which type of tap? We will launch into edit if it is a hold
 */
@property (nonatomic,assign) SEL tapAction;

@end
