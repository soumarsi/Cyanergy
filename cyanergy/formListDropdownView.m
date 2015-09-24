//
//  formListDropdownView.m
//  cyanergy
//
//  Created by koustov basu on 22/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "formListDropdownView.h"



@implementation formListDropdownView




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

//- (void)drawRect:(CGRect)rect {
//    
//     NSLog(@"draw rect...");
//    
//   
//}




-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self=[[[NSBundle mainBundle] loadNibNamed:@"formListDropdownView" owner:self options:nil]objectAtIndex:0];
        
        
    }
    return self;
}





@end
