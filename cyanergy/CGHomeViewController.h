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

@interface CGHomeViewController : UIViewController<Homeviewcontroller,cgsidebar,UIAlertViewDelegate,UIScrollViewDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listingTable;
@property (weak, nonatomic) IBOutlet UILabel *comingsoon;
@property (nonatomic, strong) RightBar *homeNav;
@property (nonatomic, strong) CGsidebar *sideBar;
@property (nonatomic, strong) CGformpopup *formPopUp;
@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *mainListedArray;
@property (nonatomic, retain) UIWebView *webView;
@end
