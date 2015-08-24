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
#import "CYAuditForm3.h"
#import <CoreLocation/CoreLocation.h>
#import "UIImage+CGimage.h"
#import "CGhomelistTableViewCell.h"
#import "CYAuditTopbar.h"
#import "UIColor+CGColor.h"
#import "mySmoothLineView.h"

@interface CGHomeViewController : UIViewController<Homeviewcontroller,cgsidebar,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIAlertViewDelegate,UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIPopoverControllerDelegate,CLLocationManagerDelegate,UIPickerViewDataSource,UIPickerViewDelegate>


@property (nonatomic, strong) RightBar *homeNav;
@property (nonatomic, strong) CGsidebar *sideBar;
@property (nonatomic, strong) CGformpopup *formPopUp;
@property (nonatomic, strong) CYAuditForm *auditForm;
@property (nonatomic, strong) CYAuditForm2 *auditForm2;
@property (nonatomic, strong) CYAuditForm3 *auditForm3;
@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (nonatomic) UIAlertView *alertView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) mySmoothLineView *auditorsignView;
@property (strong, nonatomic) mySmoothLineView *cosumerSignView;
@property (strong, nonatomic) UITextField *imageText;
@property (nonatomic, strong) NSString *check;
@property (nonatomic,strong) UIPickerView *categoryPickerView;
@property (nonatomic, strong) UIView *background;

@end
