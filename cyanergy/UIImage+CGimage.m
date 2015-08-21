//
//  UIImage+CGimage.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "UIImage+CGimage.h"

@implementation UIImage (CGimage)

+(UIImage *)topBarImage
{
    return [UIImage imageNamed:@"Header"];
}
+(UIImage *)logoImage
{
    return [UIImage imageNamed:@"Logo"];
}
+(UIImage *)logoutImage
{
    return [UIImage imageNamed:@"logoutImage"];
}
@end
