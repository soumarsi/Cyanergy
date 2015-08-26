//
//  Auditformdetails.h
//  cyanergy
//
//  Created by Soumarsi Kundu on 25/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AuditImage;

@interface Auditformdetails : NSManagedObject

@property (nonatomic, retain) NSDate *auditdate;
@property (nonatomic, retain) NSString * auditid;
@property (nonatomic, retain) NSString * consumer_addline1;
@property (nonatomic, retain) NSString * consumer_addline2;
@property (nonatomic, retain) NSString * consumer_fname;
@property (nonatomic, retain) NSString * consumer_lname;
@property (nonatomic, retain) NSString * consumer_phno;
@property (nonatomic, retain) NSString * consumer_pstcode;
@property (nonatomic, retain) NSString * consumer_state;
@property (nonatomic, retain) NSString * consumer_suburb;
@property (nonatomic, retain) NSString * formtype;
@property (nonatomic, retain) NSString * generalcomment;
@property (nonatomic, retain) NSString * generalquestion1;
@property (nonatomic, retain) NSString * generalquestion2;
@property (nonatomic, retain) NSString * generalquestion3;
@property (nonatomic, retain) NSString * generalquestion4;
@property (nonatomic, retain) NSString * generalquestion5;
@property (nonatomic, retain) NSString * generalquestion6;
@property (nonatomic, retain) NSString * generalquestion7;
@property (nonatomic, retain) NSString * generalquestion8;
@property (nonatomic, retain) NSString * installer_fname;
@property (nonatomic, retain) NSString * installer_lname;
@property (nonatomic, retain) NSString * sd15_auditstatus;
@property (nonatomic, retain) NSString * sd15_chimneyinstall;
@property (nonatomic, retain) NSString * sd15_chimneyinstallcom;
@property (nonatomic, retain) NSString * sd15_chimneysealremov;
@property (nonatomic, retain) NSString * sd15_comment;
@property (nonatomic, retain) NSString * sd15_doorinstall;
@property (nonatomic, retain) NSString * sd15_doorinstallcom;
@property (nonatomic, retain) NSString * sd15_doorsealremov;
@property (nonatomic, retain) NSString * sd15_externalchimney;
@property (nonatomic, retain) NSString * sd15_externaldoorinstall;
@property (nonatomic, retain) NSString * sd15_externaldoorinstallcom;
@property (nonatomic, retain) NSString * sd15_externamdoors;
@property (nonatomic, retain) NSString * sd15_spareproduct;
@property (nonatomic, retain) NSString * sd15_spareproductcom;
@property (nonatomic, retain) NSString * sd15_tnochimneyseal;
@property (nonatomic, retain) NSString * sd15_tnodoorseal;
@property (nonatomic, retain) NSString * sd17_auditstatus;
@property (nonatomic, retain) NSString * sd17_comment;
@property (nonatomic, retain) NSString * sd17_installbucket;
@property (nonatomic, retain) NSString * sd17_installbucketcom;
@property (nonatomic, retain) NSString * sd17_previousshower;
@property (nonatomic, retain) NSString * sd17_previousshowercom;
@property (nonatomic, retain) NSString * sd17_showerenergycom;
@property (nonatomic, retain) NSString * sd17_showerenergysaving;
@property (nonatomic, retain) NSString * sd17_spareshower;
@property (nonatomic, retain) NSString * sd17_spareshowercom;
@property (nonatomic, retain) NSString * sd17_totalnobathroom;
@property (nonatomic, retain) NSString * sd17_totalnoshower;
@property (nonatomic, retain) NSString * sd21b_auditstatus;
@property (nonatomic, retain) NSString * sd21b_comment;
@property (nonatomic, retain) NSString * sd21b_confirmglobe;
@property (nonatomic, retain) NSString * sd21b_customerglobes;
@property (nonatomic, retain) NSString * sd21b_customerglobescom;
@property (nonatomic, retain) NSString * sd21b_emptyglobes;
@property (nonatomic, retain) NSString * sd21b_emptyglobescom;
@property (nonatomic, retain) NSString * sd21b_emptysocket;
@property (nonatomic, retain) NSString * sd21b_HEglobes;
@property (nonatomic, retain) NSString * sd21b_HEglobescom;
@property (nonatomic, retain) NSString * sd21b_installheglobes;
@property (nonatomic, retain) NSString * sd21b_otherglobes;
@property (nonatomic, retain) NSString * sd21b_sensorglobes;
@property (nonatomic, retain) NSString * sd21b_sensorglobescom;
@property (nonatomic, retain) NSString * sd21b_totalnoglobes;
@property (nonatomic, retain) NSString * sd21c_auditstatus;
@property (nonatomic, retain) NSString * sd21c_comment;
@property (nonatomic, retain) NSString * sd21c_confirmglobe;
@property (nonatomic, retain) NSString * sd21c_customerglobe;
@property (nonatomic, retain) NSString * sd21c_customerglobecom;
@property (nonatomic, retain) NSString * sd21c_emptyglobe;
@property (nonatomic, retain) NSString * sd21c_emptyglobecom;
@property (nonatomic, retain) NSString * sd21c_emptysocket;
@property (nonatomic, retain) NSString * sd21c_heglobes;
@property (nonatomic, retain) NSString * sd21c_hEglobescom;
@property (nonatomic, retain) NSString * sd21c_installHEglobe;
@property (nonatomic, retain) NSString * sd21c_otherglobe;
@property (nonatomic, retain) NSString * sd21c_sensorglobes;
@property (nonatomic, retain) NSString * sd21c_sensorglobescom;
@property (nonatomic, retain) NSString * sd21c_totalnoglobes;
@property (nonatomic, retain) NSString * userid;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) AuditImage *auditimage;

@end
