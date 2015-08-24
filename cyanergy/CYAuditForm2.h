//
//  CYAuditForm2.h
//  cyanergy
//
//  Created by Prosenjit Kolay on 20/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYAuditForm2 : UIView<UITextViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *numField1;
@property (strong, nonatomic) IBOutlet UITextField *numField2;
@property (strong, nonatomic) IBOutlet UITextField *numField3;
@property (strong, nonatomic) IBOutlet UITextField *numField4;
@property (strong, nonatomic) IBOutlet UITextField *numField5;
@property (strong, nonatomic) IBOutlet UITextField *numField6;
@property (strong, nonatomic) IBOutlet UITextField *numField7;
@property (strong, nonatomic) IBOutlet UITextField *numField8;
@property (strong, nonatomic) IBOutlet UITextField *numField9;
@property (strong, nonatomic) IBOutlet UITextField *numField10;
@property (strong, nonatomic) IBOutlet UITextField *numField11;
@property (strong, nonatomic) IBOutlet UITextField *numField12;
@property (strong, nonatomic) IBOutlet UITextField *numField13;
@property (strong, nonatomic) IBOutlet UITextField *numField14;
@property (strong, nonatomic) IBOutlet UITextField *numField15;
@property (strong, nonatomic) IBOutlet UITextField *numField16;
@property (strong, nonatomic) IBOutlet UITextField *numField17;
@property (strong, nonatomic) IBOutlet UITextField *numField18;


@property (strong, nonatomic) IBOutlet UISwitch *yesNo1;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo2;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo3;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo4;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo5;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo6;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo7;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo8;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo9;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo10;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo11;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo12;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo13;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo14;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo15;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo16;


@property (strong, nonatomic) IBOutlet UITextView *commentBox1;
@property (strong, nonatomic) IBOutlet UITextView *commentBox2;
@property (strong, nonatomic) IBOutlet UITextView *commentBox3;
@property (strong, nonatomic) IBOutlet UITextView *commentBox4;
@property (strong, nonatomic) IBOutlet UITextView *commentBox5;
@property (strong, nonatomic) IBOutlet UITextView *commentBox6;
@property (strong, nonatomic) IBOutlet UITextView *commentBox7;
@property (strong, nonatomic) IBOutlet UITextView *commentBox8;
@property (strong, nonatomic) IBOutlet UITextView *commentBox9;
@property (strong, nonatomic) IBOutlet UITextView *commentBox10;
@property (strong, nonatomic) IBOutlet UITextView *commentBox11;
@property (strong, nonatomic) IBOutlet UITextView *commentBox12;
@property (strong, nonatomic) IBOutlet UITextView *commentBox13;
@property (strong, nonatomic) IBOutlet UITextView *commentBox14;
@property (strong, nonatomic) IBOutlet UITextView *commentBox15;
@property (strong, nonatomic) IBOutlet UITextView *commentBox16;
@property (strong, nonatomic) IBOutlet UITextView *commentBox17;
@property (strong, nonatomic) IBOutlet UITextView *commentBox18;
@property (strong, nonatomic) IBOutlet UITextView *commentBox19;
@property (strong, nonatomic) IBOutlet UITextView *commentBox20;
@property (strong, nonatomic) IBOutlet UITextView *commentBox21;


@property (strong, nonatomic) IBOutlet UIButton *auditStatus1;
@property (strong, nonatomic) IBOutlet UIButton *auditStatus2;
@property (strong, nonatomic) IBOutlet UIButton *auditStatus3;
@property (strong, nonatomic) IBOutlet UIButton *auditStatus4;


@property (strong, nonatomic) IBOutlet UIButton *next2;
@property (strong, nonatomic) IBOutlet UIButton *back1;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollV;

@end
