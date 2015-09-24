//
//  schedule15View.h
//  cyanergy
//
//  Created by koustov basu on 18/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface schedule15View : UIView<UITextViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>

{
    CGPoint scrollPoint;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


// Form 15 field outlets

@property (strong, nonatomic) IBOutlet UITextField *numField1;
@property (strong, nonatomic) IBOutlet UITextField *numField2;
@property (strong, nonatomic) IBOutlet UITextField *numField3;
@property (strong, nonatomic) IBOutlet UITextField *numField4;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo2;
@property (strong, nonatomic) IBOutlet UITextView *commentBox3;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo1;
@property (strong, nonatomic) IBOutlet UITextView *commentBox4;
@property (strong, nonatomic) IBOutlet UITextField *numField5;
@property (strong, nonatomic) IBOutlet UITextField *numField6;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo3;
@property (strong, nonatomic) IBOutlet UITextView *commentBox5;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo4;
@property (strong, nonatomic) IBOutlet UITextView *commentBox6;
@property (strong, nonatomic) IBOutlet UIButton *auditStatus1;
@property (strong, nonatomic) IBOutlet UITextView *commentBox2;

//Form 15 variables related to outlets

@property (strong, nonatomic) NSString *sd15_doorinstall;
@property (strong, nonatomic) NSString *sd15_chimneyinstall;
@property (strong, nonatomic) NSString *sd15_externaldoorinstall;
@property (strong, nonatomic) NSString *sd15_spareproduct;



@end
