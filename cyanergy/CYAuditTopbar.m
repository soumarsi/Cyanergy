//
//  CYAuditTopbar.m
//  cyanergy
//
//  Created by Prosenjit Kolay on 21/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CYAuditTopbar.h"

@implementation CYAuditTopbar


-(id)initWithFrame:(CGRect)frame{
    
    self = [[[NSBundle mainBundle]loadNibNamed:@"CYAuditTopbar" owner:self options:nil] objectAtIndex:0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    NSString *string = [formatter stringFromDate:[NSDate date]];
    
    _date.text = [NSString stringWithFormat:@"%@",string];

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
