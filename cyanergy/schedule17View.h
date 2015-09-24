//
//  schedule17View.h
//  cyanergy
//
//  Created by koustov basu on 18/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface schedule17View : UIView<UITextViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>

{
    CGPoint scrollPoint;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

// Form 17 outlets

@property (strong, nonatomic) IBOutlet UITextField *numField7;
@property (strong, nonatomic) IBOutlet UITextField *numField8;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo5;
@property (strong, nonatomic) IBOutlet UITextView *commentBox7;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo6;
@property (strong, nonatomic) IBOutlet UITextView *commentBox8;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo7;
@property (strong, nonatomic) IBOutlet UITextView *commentBox9;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo8;
@property (strong, nonatomic) IBOutlet UITextView *commentBox10;
@property (strong, nonatomic) IBOutlet UIButton *auditStatus2;
@property (strong, nonatomic) IBOutlet UITextView *commentBox11;

// Outlet related String variables

@property (strong, nonatomic) NSString *sd17_showerenergysaving;
@property (strong, nonatomic) NSString *sd17_previousshower;
@property (strong, nonatomic) NSString *sd17_spareshower;
@property (strong, nonatomic) NSString *sd17_installbucket;



@end
