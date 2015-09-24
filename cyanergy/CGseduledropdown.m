//
//  CGseduledropdown.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 17/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGseduledropdown.h"

@implementation CGseduledropdown

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame{
    
    self = [[[NSBundle mainBundle]loadNibNamed:@"CGseduledropdown" owner:self options:nil] objectAtIndex:0];
    
      
    return self;
    
    
}

@end
