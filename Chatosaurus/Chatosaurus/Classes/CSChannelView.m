//
//  CSChannelView.m
//  Chatosaurus
//
//  Created by Andrew Kuhnhausen <andrew.kuhnhausen@gmail.com>, Colton Myers <colton.myers@gmail.com> on 4/14/11.
//  Copyright 2011 errstr. All rights reserved.
//

#import "CSChannelView.h"
#pragma mark -
#pragma mark Private Interface
@interface CSChannelView ()
@end

#pragma mark -
@implementation CSChannelView

#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame 
                name:(NSString*)name
              avatar:(UIImage*)avatar
{
    self = [super initWithFrame:frame];
	if (self == nil)
		return nil;
	
    // Set the main view if there is an avatar
    if (avatar != nil) {
        _avatarView = [[UIImageView alloc] initWithImage:avatar];
        [_avatarView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_avatarView];
    } else {
        _textView = [[UITextView alloc] init];
        [_textView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_textView];
    }
    
    // Label the view with the name
    _name = [[UILabel alloc] init];
    [_name setText:name];
    [_name setTextAlignment:UITextAlignmentCenter];
    [_name setTextColor:[UIColor grayColor]];
    [self addSubview:_name];
    _chatButton = [[UIButton alloc] init];
    [_chatButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_chatButton];
    
    
    return self;
}
- (id) init
{
    self = [super init];
	if (self == nil)
		return nil;
    
    _name = [[UILabel alloc] init];
    _chatButton = [[UIButton alloc] init];
    _avatarView = [[UIImageView alloc] init];
    _textView = [[UITextView alloc] init];

    return self;
}

- (void) dealloc 
{
    [_name release];
    [_chatButton release];
    [_avatarView release];
    [_textView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
- (NSString*) name
{
    return [_name text];
}
- (void) setName:(NSString *)name
{
    [_name setText:name];
}

- (UIImage*) avatar
{
    return [_avatarView image];
}
- (void) setAvatar:(UIImage *)avatar
{
    [_avatarView setImage:avatar];
}

- (NSString*) text
{
    return [_textView text];
}
- (void) setText:(NSString *)text
{
    [_textView setText:text];
}

- (NSString*) description
{
    return [[NSString alloc] initWithFormat:@"%@, %@", [_name text], [_textView text]];
}
@synthesize tapTarget = _tapTarget;
@synthesize tapAction = _tapAction;

#pragma mark -
#pragma mark Methods
- (void) buttonPressed
{
    // TODO: Launch chat view
    if (_tapTarget != nil && _tapAction != NULL)
        [_tapTarget performSelector:_tapAction withObject:_userInfo];
}

#pragma mark UIView Methods
- (void) layoutSubviews
{
    CGRect divRect = [self bounds];
    //divRect = CGRectIntegral(divRect);
    //divRect = CGRectInset(divRect, 1.0f, 1.0f);
    CGRect mainViewRect = CGRectZero;
    CGRect nameRect = CGRectZero;
    CGFloat nameHeight = 12.0f;
    
    CGRectDivide(divRect, &nameRect, &mainViewRect, nameHeight, CGRectMaxYEdge);
    
//    [_textView setFrame:CGRectIntegral(mainViewRect)];
//    [_textView setBackgroundColor:[UIColor whiteColor]];
    
    [_name setFrame:CGRectIntegral(nameRect)];
    [_name setTextColor:[UIColor blackColor]];
    [_name setBackgroundColor:[UIColor whiteColor]];
    [_name setFont:[UIFont fontWithName:@"Futura" size:10.0f]];

    [_chatButton setFrame:CGRectIntegral(mainViewRect)];
    [_chatButton setBackgroundColor:[UIColor whiteColor]];
//    [self addSubview:_textView];
    [self addSubview:_name];
    [self addSubview:_chatButton];    
}

- (void) drawRect:(CGRect)rect
{
    CGRect view = CGRectInset([self bounds], 1, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    
    CGContextMoveToPoint(context, view.origin.x, view.origin.y);
    CGContextAddLineToPoint(context, view.origin.x, view.size.height);
    CGContextAddLineToPoint(context, view.size.width, view.size.height);
    CGContextAddLineToPoint(context, view.size.width, view.origin.y);
    CGContextAddLineToPoint(context, view.origin.x, view.origin.y);
    
    CGContextFillPath(context);

}
@end
