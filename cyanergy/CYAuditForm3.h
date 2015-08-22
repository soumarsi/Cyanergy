//
//  CYAuditForm3.h
//  cyanergy
//
//  Created by Prosenjit Kolay on 22/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYAuditForm3 : UIView<UIScrollViewDelegate>


@property (strong, nonatomic) IBOutlet UIScrollView *scrollV;

@property (strong, nonatomic) IBOutlet UIImageView *imageInitial;
@property (strong, nonatomic) IBOutlet UIButton *addImage;


@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) IBOutlet UIView *auditorSigView;
@property (strong, nonatomic) IBOutlet UIView *custSigView;


@property (strong, nonatomic) IBOutlet UIButton *submit;
@property (strong, nonatomic) IBOutlet UIButton *back3;


@end
