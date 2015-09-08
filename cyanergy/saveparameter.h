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
@interface saveparameter : NSObject
{
    CGAppDelegate *cyanergyAppdelegate;
    Listingtable *list;
}

@property (nonatomic, strong) NSString *returnString;
-(NSString *)savestring:(Listingtable *)saveArray;
@end
