//
//  ViewController.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 17/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *login;
- (IBAction)log_in:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *baseView;


@end

