//
//  CYAuditForm.h
//  cyanergy
//
//  Created by Prosenjit Kolay on 19/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol switchFun <NSObject>
//
//-(void)onoff;
//
//@end

@interface CYAuditForm : UIView<UITextViewDelegate,UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *suburb;
@property (strong, nonatomic) IBOutlet UITextField *postcode;
@property (strong, nonatomic) IBOutlet UITextField *address1;
@property (strong, nonatomic) IBOutlet UITextField *address2;
@property (strong, nonatomic) IBOutlet UITextField *state;
@property (strong, nonatomic) IBOutlet UITextField *installFirstName;
@property (strong, nonatomic) IBOutlet UITextField *installLastName;
@property (strong, nonatomic) IBOutlet UITextView *comment;
@property (strong, nonatomic) IBOutlet UIButton *next;


@property (strong, nonatomic) IBOutlet UISwitch *yesNo1;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo2;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo3;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo4;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo5;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo6;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo7;
@property (strong, nonatomic) IBOutlet UISwitch *yesNo8;

@property (strong, nonatomic) NSString *generalQuestion1;
@property (strong, nonatomic) NSString *generalQuestion2;
@property (strong, nonatomic) NSString *generalQuestion3;
@property (strong, nonatomic) NSString *generalQuestion4;
@property (strong, nonatomic) NSString *generalQuestion5;
@property (strong, nonatomic) NSString *generalQuestion6;
@property (strong, nonatomic) NSString *generalQuestion7;
@property (strong, nonatomic) NSString *generalQuestion8;


//@property (nonatomic, weak) id<switchFun>delegate;


//- (IBAction)onoffButton:(id)sender;

@end
