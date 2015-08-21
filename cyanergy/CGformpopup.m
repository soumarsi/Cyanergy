//
//  CGformpopup.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGformpopup.h"
#import <QuartzCore/QuartzCore.h>
@implementation CGformpopup

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    DebugLog(@"frame--- %f--- %f----%f----%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    //self = [super initWithFrame:frame];
//    if (self)
//    {
        self = [[[NSBundle mainBundle]loadNibNamed:@"Formpopup" owner:self options:nil] objectAtIndex:0];
        
        DebugLog(@"frame--- %f--- %f----%f----%f", self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height);
        
        _formBaseView.layer.masksToBounds = NO;
        _formBaseView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        _formBaseView.layer.shadowRadius = 20;
        _formBaseView.layer.shadowOpacity = 0.5;
   // }
    
    return self;
}

@end
