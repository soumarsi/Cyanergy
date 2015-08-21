//
//  CYAuditForm.m
//  cyanergy
//
//  Created by Prosenjit Kolay on 19/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CYAuditForm.h"
#import <QuartzCore/QuartzCore.h>
@implementation CYAuditForm

-(id)initWithFrame:(CGRect)frame{
    
    self = [[[NSBundle mainBundle]loadNibNamed:@"CYAuditForm" owner:self options:nil] objectAtIndex:0];
    
    if (self) {
        
        _firstName.delegate = self;
        _lastName.delegate = self;
        _phone.delegate = self;
        _suburb.delegate = self;
        _postcode.delegate = self;
        _state.delegate = self;
        _address1.delegate = self;
        _address2.delegate = self;
        _installFirstName.delegate = self;
        _installLastName.delegate = self;
        _comment.delegate = self;

        _firstName.layer.borderWidth = 1.0f;
        _lastName.layer.borderWidth = 1.0f;
        _postcode.layer.borderWidth = 1.0f;
        _phone.layer.borderWidth = 1.0f;
        _suburb.layer.borderWidth = 1.0f;
        _state.layer.borderWidth = 1.0f;
        _address1.layer.borderWidth = 1.0f;
        _address2.layer.borderWidth = 1.0f;
        _installFirstName.layer.borderWidth = 1.0f;
        _installLastName.layer.borderWidth = 1.0f;
        _comment.layer.borderWidth = 1.0f;
        

        _yesNo1.transform = CGAffineTransformMakeScale(0.80, 0.80);
        _yesNo2.transform = CGAffineTransformMakeScale(0.80, 0.80);
        _yesNo3.transform = CGAffineTransformMakeScale(0.80, 0.80);
        _yesNo4.transform = CGAffineTransformMakeScale(0.80, 0.80);
        _yesNo5.transform = CGAffineTransformMakeScale(0.80, 0.80);
        _yesNo6.transform = CGAffineTransformMakeScale(0.80, 0.80);
        _yesNo7.transform = CGAffineTransformMakeScale(0.80, 0.80);
        _yesNo8.transform = CGAffineTransformMakeScale(0.80, 0.80);
                

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
