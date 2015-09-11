//
//  saveparameter.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 08/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGAppDelegate.h"
#import "Listingtable.h"
#import "Auditformdetails.h"
#import "AuditImage.h"
#import "CGglobal.h"
#import "ASIFormDataRequest.h"
@interface saveparameter : NSObject<ASIHTTPRequestDelegate>
{
    CGAppDelegate *cyanergyAppdelegate;
    Listingtable *list;
    Urlresponceblock _responce;
}

@property (nonatomic, strong) NSString *returnString;
-(NSString *)savestring:(Listingtable *)saveArray;
-(void)saveparameterstr:(Listingtable *)saveArray withblock:(Urlresponceblock) responce;
@end
