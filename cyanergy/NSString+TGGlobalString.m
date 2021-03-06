//
//  NSString+TGGlobalString.m
//  Tailgate-All
//
//  Created by Soumarsi Kundu on 25/06/15.
//  Copyright (c) 2015 esolz. All rights reserved.
//

#import "NSString+TGGlobalString.h"

@implementation NSString (CGGlobalString)

+(NSString *)check_username
{
    return @"Please enter valid username";
}
+(NSString *)check_password
{
    return @"Please enter valid password";
}
+(NSString *)check_internet
{
    return @"please check your internet connection";
}
+(NSString *)check_internet_title
{
    return @"sorry!";
}
+(NSString *)Ok
{
    return @"OK";
}
+(NSString *)success
{
    return @"success";
}
+(NSString *)Login_Failed
{
    return @"invalid login credentials";
}

@end
