//
//  CGglobalfunction.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 07/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGglobalfunction.h"

#define App_Domain_Url @"http://esolz.co.in/lab6/cyanergy/webservice/"
#define saveurl @"action.php?mode=save"

@implementation CGglobalfunction
-(void)Userdict:(NSDictionary *)userdetails
{
    UserData = [[NSUserDefaults alloc]init];
    
    [UserData setObject:[userdetails objectForKey:@"id"] forKey:@"userid"];
    [UserData setObject:[userdetails objectForKey:@"username"] forKey:@"username"];
    [UserData setObject:@"YES" forKey:@"Logout"];
    [UserData setObject:@"YES" forKey:@"Remember"];
    [UserData synchronize];
}
- (BOOL)connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}


-(void)parameterstring:(NSString *)parameter withblock:(Urlresponceblock)responce
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",App_Domain_Url,parameter]];
    DebugLog(@"URL---- %@",[NSString stringWithFormat:@"%@%@",App_Domain_Url,parameter]);
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(error == nil)
                                                        {
                                                            text = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                            responce(text,nil);
                                                        }
                                                        
                                                    }];
    
    [dataTask resume];
    
}

//save data to server
-(void)saveparameterstr:(NSString *)savestring withblock:(Urlresponceblock) responce
{
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",App_Domain_Url,saveurl]];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
 
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[savestring dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                                           NSLog(@"Response:%@ %@\n", response, error);
                                                           if(error == nil)
                                                           {
                                                              NSDictionary *saveresult = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                               responce(saveresult,nil);
                                                           }
                                                           
                                                       }];
    [dataTask resume];
}
@end
