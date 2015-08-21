//
//  CYAuditForm2.m
//  cyanergy
//
//  Created by Prosenjit Kolay on 20/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CYAuditForm2.h"
#import <QuartzCore/QuartzCore.h>

@implementation CYAuditForm2

-(id)initWithFrame:(CGRect)frame{
    
    self = [[[NSBundle mainBundle]loadNibNamed:@"CYAuditForm2" owner:self options:nil] objectAtIndex:0];
    
    
    _numField1.delegate = self;
    _numField2.delegate = self;
    _numField3.delegate = self;
    _numField4.delegate = self;
    _numField5.delegate = self;
    _numField6.delegate = self;
    _numField7.delegate = self;
    _numField8.delegate = self;
    _numField9.delegate = self;
    _numField10.delegate = self;
    _numField11.delegate = self;
    _numField12.delegate = self;
    _numField13.delegate = self;
    _numField14.delegate = self;
    _numField15.delegate = self;
    _numField16.delegate = self;
    _numField17.delegate = self;
    _numField18.delegate = self;
    
    _numField1.layer.borderWidth = 1.0f;
    _numField2.layer.borderWidth = 1.0f;
    _numField3.layer.borderWidth = 1.0f;
    _numField4.layer.borderWidth = 1.0f;
    _numField5.layer.borderWidth = 1.0f;
    _numField6.layer.borderWidth = 1.0f;
    _numField7.layer.borderWidth = 1.0f;
    _numField8.layer.borderWidth = 1.0f;
    _numField9.layer.borderWidth = 1.0f;
    _numField10.layer.borderWidth = 1.0f;
    _numField11.layer.borderWidth = 1.0f;
    _numField12.layer.borderWidth = 1.0f;
    _numField13.layer.borderWidth = 1.0f;
    _numField14.layer.borderWidth = 1.0f;
    _numField15.layer.borderWidth = 1.0f;
    _numField16.layer.borderWidth = 1.0f;
    _numField17.layer.borderWidth = 1.0f;
    _numField18.layer.borderWidth = 1.0f;
    
    
    _commentBox1.delegate = self;
    _commentBox2.delegate = self;
    _commentBox3.delegate = self;
    _commentBox4.delegate = self;
    _commentBox5.delegate = self;
    _commentBox6.delegate = self;
    _commentBox7.delegate = self;
    _commentBox8.delegate = self;
    _commentBox9.delegate = self;
    _commentBox10.delegate = self;
    _commentBox11.delegate = self;
    _commentBox12.delegate = self;
    _commentBox13.delegate = self;
    _commentBox14.delegate = self;
    _commentBox15.delegate = self;
    _commentBox16.delegate = self;
    _commentBox17.delegate = self;
    _commentBox18.delegate = self;
    _commentBox19.delegate = self;
    _commentBox20.delegate = self;
    _commentBox21.delegate = self;
    
    _commentBox1.layer.borderWidth = 1.0f;
    _commentBox2.layer.borderWidth = 1.0f;
    _commentBox3.layer.borderWidth = 1.0f;
    _commentBox4.layer.borderWidth = 1.0f;
    _commentBox5.layer.borderWidth = 1.0f;
    _commentBox6.layer.borderWidth = 1.0f;
    _commentBox7.layer.borderWidth = 1.0f;
    _commentBox8.layer.borderWidth = 1.0f;
    _commentBox9.layer.borderWidth = 1.0f;
    _commentBox10.layer.borderWidth = 1.0f;
    _commentBox11.layer.borderWidth = 1.0f;
    _commentBox12.layer.borderWidth = 1.0f;
    _commentBox13.layer.borderWidth = 1.0f;
    _commentBox14.layer.borderWidth = 1.0f;
    _commentBox15.layer.borderWidth = 1.0f;
    _commentBox16.layer.borderWidth = 1.0f;
    _commentBox17.layer.borderWidth = 1.0f;
    _commentBox18.layer.borderWidth = 1.0f;
    _commentBox19.layer.borderWidth = 1.0f;
    _commentBox20.layer.borderWidth = 1.0f;
    _commentBox21.layer.borderWidth = 1.0f;
    
    
    _yesNo1.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo2.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo3.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo4.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo5.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo6.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo7.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo8.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo9.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo10.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo11.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo12.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo13.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo14.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo15.transform = CGAffineTransformMakeScale(0.80, 0.80);
    _yesNo16.transform = CGAffineTransformMakeScale(0.80, 0.80);
    
    _scrollV.delegate = self;
    

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
