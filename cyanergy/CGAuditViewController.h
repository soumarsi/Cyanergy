//
//  CGAuditViewController.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 27/08/15.
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
#import "UIFont+CGFont.h"
#import "CGAppDelegate.h"
#import "Auditformdetails.h"
#import "AuditImage.h"
#import "Listingtable.h"
#import "FormView.h"
#import "CGHomeViewController.h"
#import <CoreText/CoreText.h>
@interface CGAuditViewController : UIViewController<Homeviewcontroller,cgsidebar,UITextFieldDelegate,UITextViewDelegate,UIAlertViewDelegate,UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIPopoverControllerDelegate,CLLocationManagerDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    CYAuditTopbar *topbar;
    UIImage *MainImage;
    UIActionSheet *sheet;
    NSMutableArray *imgStoreArray;
    UIImageView *dynamicImageView;
    int count,divide;
    UIButton *plusbutton;
    CGFloat latitude,longitude;
    UIButton *crossButton;
    NSArray *pickerData;
    NSString *status;
    CGAppDelegate *cyanergyAppdelegate;
    Auditformdetails *auditFormDetails;
    AuditImage *auditImage;
    Listingtable *Listed;
    FormView *completeForm;
    NSMutableData *pdfData;
    UIScrollView *scview;
    UIView *lineview1;
}

@property (weak, nonatomic) IBOutlet UIView *baseview;
@property (nonatomic, strong) RightBar *homeNav;
@property (nonatomic, strong) CGsidebar *sideBar;
@property (nonatomic, strong) CGformpopup *formPopUp;
@property (nonatomic, strong) CYAuditForm *auditForm;
@property (nonatomic, strong) CYAuditForm2 *auditForm2;
@property (nonatomic, strong) CYAuditForm3 *auditForm3;
@property (nonatomic) UIAlertView *alertView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) mySmoothLineView *auditorsignView;
@property (strong, nonatomic) mySmoothLineView *cosumerSignView;
@property (strong, nonatomic) UITextField *imageText;
@property (nonatomic, strong) NSString *check;
@property (nonatomic,strong) UIPickerView *categoryPickerView;
@property (nonatomic, strong) UIView *background;
@property (nonatomic, strong) NSMutableArray *imageTextArray;
@property (nonatomic, strong) NSMutableArray *mainListedArray;
@end
