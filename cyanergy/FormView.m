//
//  FormView.m
//  Cyanergy
//
//  Created by Somenath on 25/08/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import "FormView.h"

@implementation FormView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    
    self = [[[NSBundle mainBundle]loadNibNamed:@"FormView" owner:self options:nil] objectAtIndex:0];
    return self;
}
@end
