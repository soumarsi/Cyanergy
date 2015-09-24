//
//  schedule21CView.h
//  cyanergy
//
//  Created by koustov basu on 21/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface schedule21CView : UIView<UITextViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>

{
    CGPoint scrollPoint;
}


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

// Form 21C outlet connections

@property (strong, nonatomic) IBOutlet UITextField *numField18;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo15;
@property (strong, nonatomic) IBOutlet UITextView *commentBox21;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo16;
@property (strong, nonatomic) IBOutlet UITextView *commentBox17;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo13;
@property (strong, nonatomic) IBOutlet UITextView *commentBox18;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo14;
@property (strong, nonatomic) IBOutlet UITextView *commentBox19;
@property (strong, nonatomic) IBOutlet UITextField *numField16;
@property (strong, nonatomic) IBOutlet UITextField *numField15;
@property (strong, nonatomic) IBOutlet UITextField *numField14;
@property (strong, nonatomic) IBOutlet UITextField *numField17;
@property (strong, nonatomic) IBOutlet UIButton *auditStatus4;
@property (strong, nonatomic) IBOutlet UITextView *commentBox20;

// Outlet related string variables

@property (strong, nonatomic) NSString *sd21c_sensorglobes;
@property (strong, nonatomic) NSString *sd21c_emptyglobe;
@property (strong, nonatomic) NSString *sd21c_heglobes;
@property (strong, nonatomic) NSString *sd21c_customerglobe;


@end
