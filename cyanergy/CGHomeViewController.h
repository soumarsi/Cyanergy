//
//  CGHomeViewController.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RightBar.h"
#import "CGsidebar.h"
#import "CGformpopup.h"
#import "CGformpopupTableViewCell.h"
#import "CYAuditForm.h"
#import "CYAuditForm2.h"

@interface CGHomeViewController : UIViewController


@property (nonatomic, strong) RightBar *homeNav;
@property (nonatomic, strong) CGsidebar *sideBar;
@property (nonatomic, strong) CGformpopup *formPopUp;
@property (nonatomic, strong) CYAuditForm *auditForm;
@property (nonatomic, strong) CYAuditForm2 *auditForm2;
@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (nonatomic) UIAlertView *alertView;

@property (nonatomic, strong) NSString *check;

@end
