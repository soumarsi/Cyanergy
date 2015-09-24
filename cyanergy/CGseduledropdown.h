//
//  CGseduledropdown.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 17/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGseduledropdown : UIView

//@property (weak, nonatomic) IBOutlet UIButton *CGdropDownButton;
@property (weak, nonatomic) IBOutlet UITableView *CGseduleTable;
@property (weak, nonatomic) IBOutlet UIButton *CGupdatebutton;

@property (strong, nonatomic) IBOutlet UIButton *dropdownListBtn;

@property (strong, nonatomic) IBOutlet UIButton *updateBtn;

@property (strong, nonatomic) IBOutlet UIButton *backBtn;

@property (strong, nonatomic) IBOutlet UIButton *nextBtn;

@end
