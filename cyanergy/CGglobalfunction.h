//
//  CGglobalfunction.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 07/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <netdb.h>
#import "CGglobal.h"

@interface CGglobalfunction : NSObject<NSURLSessionTaskDelegate>
{
    NSUserDefaults *UserData;
    NSDictionary * text;
}

- (BOOL)connectedToNetwork;
-(void)parameterstring:(NSString *)parameter withblock:(Urlresponceblock)responce;
-(void)Userdict:(NSDictionary *)userdetails;

@end
