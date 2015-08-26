//
//  FormView.h
//  Cyanergy
//
//  Created by Somenath on 25/08/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormView : UIView

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UILabel *auditor_name_lbl;
@property (strong, nonatomic) IBOutlet UILabel *date_lbl;

@property (strong, nonatomic) IBOutlet UILabel *first_name_lbl;
@property (strong, nonatomic) IBOutlet UILabel *last_name_lbl;
@property (strong, nonatomic) IBOutlet UILabel *ph_no_lbl;
@property (strong, nonatomic) IBOutlet UILabel *add1_lbl;
@property (strong, nonatomic) IBOutlet UILabel *subrub_lbl;
@property (strong, nonatomic) IBOutlet UILabel *add2_lbl;
@property (strong, nonatomic) IBOutlet UILabel *post_code_lbl;
@property (strong, nonatomic) IBOutlet UILabel *state_lbl;

@property (strong, nonatomic) IBOutlet UILabel *installer_first_name;
@property (strong, nonatomic) IBOutlet UILabel *installer_last_name_lbl;

@property (strong, nonatomic) IBOutlet UILabel *gen_qus1_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *gen_qus2_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *gen_qus3_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *gen_qus4_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *gen_qus5_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *gen_qus6_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *gen_qus7_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *gen_qus8_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *gen_qus_comment_tview;

@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus1_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus2_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus3_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus4_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus5_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule15_qus5_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus6_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule15_qus6_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus7_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus8_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus9_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_qus10_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule15_qus9_comment_tview;
@property (strong, nonatomic) IBOutlet UITextView *schedule15_qus10_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule15_auditStatus_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule15_auditStatus_comment_tview;

@property (strong, nonatomic) IBOutlet UILabel *schedule17_qus1_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule17_qus2_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule17_qus3_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule17_qus3_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule17_qus4_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule17_qus4_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule17_qus25_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule17_qus5_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule17_qus6_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule17_qus6_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule17_auditStatus_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule17_auditStatus_comment_tview;

@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus1_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus2_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21B_qus2_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus3_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21B_qus3_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus4_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21B_qus4_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus5_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21B_qus5_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus6_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus7_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus8_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_qus9_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21B_auditStatus_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21B_auditStatus_comment_tview;

@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus1_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus2_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21C_qus2_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus3_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21C_qus3_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus4_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21C_qus4_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus5_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21C_qus5_comment_tview;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus6_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus7_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus8_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_qus9_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UILabel *schedule21C_auditStatus_yesNo_lbl;
@property (strong, nonatomic) IBOutlet UITextView *schedule21C_auditStatus_comment_tview;
@end
