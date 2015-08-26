//
//  AuditImage.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 25/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Auditformdetails;

@interface AuditImage : NSManagedObject

@property (nonatomic, retain) NSString * auditid;
@property (nonatomic, retain) NSData * auditorsignature;
@property (nonatomic, retain) NSData * customersignature;
@property (nonatomic, retain) NSString * formtype;
@property (nonatomic) float gpslatitude;
@property (nonatomic) float gpslongitude;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSData * imagetext;
@property (nonatomic, retain) Auditformdetails *auditform;

@end
