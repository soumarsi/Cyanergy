//
//  Listingtable.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 26/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Auditformdetails;

@interface Listingtable : NSManagedObject

@property (nonatomic, retain) NSString * formtype;
@property (nonatomic, retain) NSData * pdfdata;
@property (nonatomic, retain) NSDate *creationdate;
@property (nonatomic, retain) NSString * customer_fname;
@property (nonatomic, retain) NSString * customer_lname;
@property (nonatomic, retain) Auditformdetails *auditform;

@end
