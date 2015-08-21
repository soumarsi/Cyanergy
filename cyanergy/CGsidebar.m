//
//  CGsidebar.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGsidebar.h"

@implementation CGsidebar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self = [[[NSBundle mainBundle] loadNibNamed:@"Sidebar" owner:self options:nil] lastObject];
        
        [self.formButton addTarget:_delegate action:@selector(formfunction) forControlEvents:UIControlEventTouchUpInside];
         [self.quoteButton addTarget:_delegate action:@selector(quotefunction) forControlEvents:UIControlEventTouchUpInside];
         [self.invoiceButton addTarget:_delegate action:@selector(invoicefunction) forControlEvents:UIControlEventTouchUpInside];
         [self.syncButton addTarget:_delegate action:@selector(syncfunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return  self;
}

@end
