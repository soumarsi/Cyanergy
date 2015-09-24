//
//  schedule21BView.h
//  cyanergy
//
//  Created by koustov basu on 21/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface schedule21BView : UIView<UITextViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>

{
    CGPoint scrollPoint;
}


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

// Form 21B outlet connections

@property (strong, nonatomic) IBOutlet UITextField *numField9;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo9;
@property (strong, nonatomic) IBOutlet UITextView *commentBox12;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo10;
@property (strong, nonatomic) IBOutlet UITextView *commentBox13;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo11;
@property (strong, nonatomic) IBOutlet UITextView *commentBox14;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo12;
@property (strong, nonatomic) IBOutlet UITextView *commentBox15;
@property (strong, nonatomic) IBOutlet UITextField *numField10;
@property (strong, nonatomic) IBOutlet UITextField *numField11;
@property (strong, nonatomic) IBOutlet UITextField *numField12;
@property (strong, nonatomic) IBOutlet UITextField *numField13;
@property (strong, nonatomic) IBOutlet UIButton *auditStatus3;
@property (strong, nonatomic) IBOutlet UITextView *commentBox16;




// Outlet related String variables

@property (strong, nonatomic) NSString *sd21b_sensorglobes;
@property (strong, nonatomic) NSString *sd21b_emptyglobes;
@property (strong, nonatomic) NSString *sd21b_HEglobes;
@property (strong, nonatomic) NSString *sd21b_customerglobes;



@end
