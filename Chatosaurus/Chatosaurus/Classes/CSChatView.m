//
//  CSChatView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChatView.h"

#pragma mark -
#pragma mark Private Interface
@interface CSChatView ()
@end

#pragma mark -
@implementation CSChatView

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
	if (self == nil)
		return nil;
    
    [self setBackgroundColor:[UIColor whiteColor]];
    
    _textEntry = [[UITextField alloc] 
                  initWithFrame:CGRectMake(frame.origin.x + frame.size.width * (0.05f), 
                                           frame.origin.y + frame.size.height * (0.9f),
                                           frame.size.width * (0.7f), 
                                           frame.size.height * (0.08f))];
    [_textEntry setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_textEntry setBorderStyle:UITextBorderStyleRoundedRect];
    [_textEntry setBackgroundColor:[UIColor clearColor]];
    [_textEntry addTarget:self action:@selector(textEntryDidBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [_textEntry addTarget:self action:@selector(textEntryDidEndEditing) forControlEvents:UIControlEventEditingDidEnd];
    [_textEntry setKeyboardType:UIKeyboardTypeAlphabet];
    [_textEntry setReturnKeyType:UIReturnKeyDone];
    [_textEntry setDelegate:(id)self];
    
    _textView = [[UITextView alloc]
                 initWithFrame:CGRectMake(frame.origin.x + frame.size.width * (0.025f), 
                                          frame.origin.y + frame.size.height * (0.025f), 
                                          frame.size.width * (0.95f), 
                                          frame.size.height * (0.85f))];
    [_textView setEditable:FALSE];
    
    _sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sendButton setFrame:CGRectMake(frame.origin.x + frame.size.width * (0.8f), 
                                     frame.origin.y + frame.size.height * (0.9f),
                                     frame.size.width * (0.15f), 
                                     frame.size.height * (0.08f))];
//    
//    _sendButton = [[UIButton alloc]
//                   initWithFrame:CGRectMake(frame.origin.x + frame.size.width * (0.8f), 
//                                            frame.origin.y + frame.size.height * (0.9f),
//                                            frame.size.width * (0.15f), 
//                                            frame.size.height * (0.08f))]; 
    [_sendButton setTitle:@"Send" forState:UIControlStateNormal];
//    [_sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
//    [_sendButton setOpaque:TRUE];
//    [_sendButton setBackgroundColor:[UIColor lightGrayColor]];
    [_sendButton setShowsTouchWhenHighlighted:TRUE];
    [_sendButton addTarget:self action:@selector(sendButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_sendButton];
    [self addSubview:_textView];
    [self addSubview:_textEntry];
	
    return self;
}

- (void) dealloc 
{
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize identifier = _identifier;
- (void) setIdentifier:(NSString *)identifier
{
    _identifier = identifier;
}
#pragma mark -
#pragma mark Methods

#pragma mark -
#pragma mark Delegate Methods/Event Handlers

- (void) textEntryDidBeginEditing
{
    CGRect frame = [self frame];
    [self setFrame:CGRectMake(frame.origin.x, frame.origin.y - 216, frame.size.width, frame.size.height)];
    
    frame = [_textView frame];
    [_textView setFrame:CGRectMake(frame.origin.x, frame.origin.y + 216, frame.size.width, frame.size.height - 216)];
}

- (void) textEntryDidEndEditing
{
    CGRect frame = [self frame];
    [self setFrame:CGRectMake(frame.origin.x, frame.origin.y + 216, frame.size.width, frame.size.height)];
    
    frame = [_textView frame];
    [_textView setFrame:CGRectMake(frame.origin.x, frame.origin.y - 216, frame.size.width, frame.size.height + 216)];
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void) sendButtonPressed
{
    if([_textEntry isEditing])
        [_textEntry resignFirstResponder];
    
    if([[_textEntry text] length] > 0)
    {
        [_textEntry setText:@""];
        NSLog(@"Send button pressed!\n");
    }
}

#pragma mark UIView Methods
- (void) layoutSubviews
{
}

@end
