//
//  CGhomelistTableViewCell.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGhomelistTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creationdate;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UIButton *pdfshow;

@end
