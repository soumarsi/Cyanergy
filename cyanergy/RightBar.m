
//
//  RightBar.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "RightBar.h"
#import "UIImage+CGimage.h"
#import "UIFont+CGFont.h"
@implementation RightBar
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _userName = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 110.0f, 40.0f)];
        [_userName setBackgroundColor:[UIColor clearColor]];
        [_userName setTextAlignment:NSTextAlignmentCenter];
        [_userName setTextColor:[UIColor blackColor]];
        [_userName setFont:[UIFont usernameFont]];
        [self addSubview:_userName];
        
        
        _logoutButton = [[UIButton alloc]initWithFrame:CGRectMake(_userName.frame.size.width, 0, 56, 44)];
        [_logoutButton setImage:[UIImage logoutImage] forState:UIControlStateNormal];
        [_logoutButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_logoutButton];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
