//
//  RightBar.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol Homeviewcontroller
@required
-(void)logout;
@end
@interface RightBar : UIView
@property (weak, nonatomic) id <Homeviewcontroller> delegate;
@property (strong, nonatomic) UILabel *userName;
@property (strong, nonatomic) UIButton *logoutButton;
@end
