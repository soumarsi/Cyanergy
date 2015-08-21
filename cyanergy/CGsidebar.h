//
//  CGsidebar.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol cgsidebar<NSObject>

-(void)formfunction;
-(void)quotefunction;
-(void)invoicefunction;
-(void)syncfunction;

@end
@interface CGsidebar : UIView
@property (weak, nonatomic) IBOutlet UIButton *formButton;
@property (weak, nonatomic) IBOutlet UIButton *quoteButton;
@property (weak, nonatomic) IBOutlet UIButton *invoiceButton;
@property (weak, nonatomic) IBOutlet UIButton *syncButton;
@property (weak, nonatomic) id <cgsidebar> delegate;



@end
