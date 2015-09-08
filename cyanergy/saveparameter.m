//
//  saveparameter.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 08/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "saveparameter.h"

@implementation saveparameter

-(NSString *)savestring:(Listingtable *)saveArray
{
     NSString *params = [NSString stringWithFormat:@"userid=%@&username=%@&auditid=%@&auditdate=%@&formtype=%@&consumer_fname=%@&consumer_lname=%@&consumer_phno=%@&consumer_pstcode=%@&consumer_state=%@&consumer_suburb=%@&consumer_addline1=%@&consumer_addline2=%@&installer_fname=%@&installer_lname=%@&generalquestion1=%@&generalquestion2=%@&generalquestion3=%@&generalquestion4=%@&generalquestion5=%@&generalquestion6=%@&generalquestion7=%@&generalquestion8=%@&generalcomment=%@&sd15_tnodoorseal=%@&sd15_tnochimneyseal=%@&sd15_externamdoors=%@&sd15_externalchimney=%@&sd15_doorinstall=%@&sd15_doorinstallcom=%@&sd15_chimneyinstall=%@&sd15_chimneyinstallcom=%@&sd15_doorsealremov=%@&sd15_externaldoorinstall=%@&sd15_externaldoorinstallcom=%@&sd15_spareproduct=%@&sd15_spareproductcom=%@&sd15_auditstatus=%@&sd15_comment=%@&",saveArray.auditform.userid,saveArray.auditform.username,saveArray.auditform.auditid,saveArray.auditform.auditdate,saveArray.auditform.formtype,saveArray.auditform.consumer_fname,saveArray.auditform.consumer_lname,saveArray.auditform.consumer_phno,saveArray.auditform.consumer_pstcode,saveArray.auditform.consumer_state,saveArray.auditform.consumer_suburb,saveArray.auditform.consumer_addline1,saveArray.auditform.consumer_addline2,saveArray.auditform.installer_fname,saveArray.auditform.installer_lname,saveArray.auditform.generalquestion1,saveArray.auditform.generalquestion2,saveArray.auditform.generalquestion3,saveArray.auditform.generalquestion4,saveArray.auditform.generalquestion5,saveArray.auditform.generalquestion6,saveArray.auditform.generalquestion7,saveArray.auditform.generalquestion8,saveArray.auditform.generalcomment,saveArray.auditform.sd15_tnodoorseal,saveArray.auditform.sd15_tnochimneyseal,saveArray.auditform.sd15_externamdoors,saveArray.auditform.sd15_externalchimney,saveArray.auditform.sd15_doorinstall,saveArray.auditform.sd15_doorinstallcom,saveArray.auditform.sd15_chimneyinstall,saveArray.auditform.sd15_chimneyinstallcom,saveArray.auditform.sd15_doorsealremov,saveArray.auditform.sd15_externaldoorinstall,saveArray.auditform.sd15_externaldoorinstallcom,saveArray.auditform.sd15_spareproduct,saveArray.auditform.sd15_spareproductcom,saveArray.auditform.sd15_auditstatus,saveArray.auditform.sd15_comment];
    
    NSString *parames1 = [NSString stringWithFormat:@"sd17_totalnoshower=%@&sd17_totalnobathroom=%@&sd17_showerenergysaving=%@&sd17_showerenergycom=%@&sd17_previousshower=%@&sd17_previousshowercom=%@&sd17_spareshower=%@&sd17_spareshowercom=%@&sd17_installbucket=%@&sd17_installbucketcom=%@&sd17_auditstatus=%@&sd17_comment=%@&",saveArray.auditform.sd17_totalnoshower,saveArray.auditform.sd17_totalnobathroom,saveArray.auditform.sd17_showerenergysaving,saveArray.auditform.sd17_showerenergycom,saveArray.auditform.sd17_previousshower,saveArray.auditform.sd17_previousshowercom,saveArray.auditform.sd17_spareshower,saveArray.auditform.sd17_spareshowercom,saveArray.auditform.sd17_installbucket,saveArray.auditform.sd17_installbucketcom,saveArray.auditform.sd17_auditstatus,saveArray.auditform.sd17_comment];
    
    NSString *parames2 = [NSString stringWithFormat:@"sd21b_totalnoglobes=%@&sd21b_sensorglobes=%@&sd21b_sensorglobescom=%@&sd21b_emptyglobes=%@&sd21b_emptyglobescom=%@&sd21b_HEglobes=%@&sd21b_HEglobescom=%@&sd21b_customerglobes=%@&sd21b_customerglobescom=%@&sd21b_confirmglobe=%@&sd21b_otherglobes=%@&sd21b_emptysocket=%@&sd21b_installheglobes=%@&sd21b_auditstatus=%@&sd21b_comment=%@&",saveArray.auditform.sd21b_totalnoglobes,saveArray.auditform.sd21b_sensorglobes,saveArray.auditform.sd21b_sensorglobescom,saveArray.auditform.sd21b_emptyglobes,saveArray.auditform.sd21b_emptyglobescom,saveArray.auditform.sd21b_HEglobes,saveArray.auditform.sd21b_HEglobescom,saveArray.auditform.sd21b_customerglobes,saveArray.auditform.sd21b_customerglobescom,saveArray.auditform.sd21b_confirmglobe,saveArray.auditform.sd21b_otherglobes,saveArray.auditform.sd21b_emptysocket,saveArray.auditform.sd21b_installheglobes,saveArray.auditform.sd21b_auditstatus,saveArray.auditform.sd21b_comment];
    
    NSString *parames3 = [NSString stringWithFormat:@"sd21c_totalnoglobes=%@&sd21c_sensorglobes=%@&sd21c_sensorglobescom=%@&sd21c_emptyglobe=%@&sd21c_emptyglobecom=%@&sd21c_heglobes=%@&sd21c_hEglobescom=%@&sd21c_customerglobe=%@&sd21c_customerglobecom=%@&sd21c_confirmglobe=%@&sd21c_otherglobe=%@&sd21c_emptysocket=%@&sd21c_installHEglobe=%@&sd21c_auditstatus=%@&sd21c_comment=%@&gpslatitude=%f&gpslongitude=%f",saveArray.auditform.sd21c_totalnoglobes,saveArray.auditform.sd21c_sensorglobes,saveArray.auditform.sd21c_sensorglobescom,saveArray.auditform.sd21c_emptyglobe,saveArray.auditform.sd21c_emptyglobecom,saveArray.auditform.sd21c_heglobes,saveArray.auditform.sd21c_hEglobescom,saveArray.auditform.sd21c_customerglobe,saveArray.auditform.sd21c_customerglobecom,saveArray.auditform.sd21c_confirmglobe,saveArray.auditform.sd21c_otherglobe,saveArray.auditform.sd21c_emptysocket,saveArray.auditform.sd21c_installHEglobe,saveArray.auditform.sd21c_auditstatus,saveArray.auditform.sd21c_comment,saveArray.auditform.auditimage.gpslatitude,saveArray.auditform.auditimage.gpslongitude];
    
    
    _returnString = [NSString stringWithFormat:@"%@%@%@%@",params,parames1,parames2,parames3];
    
    return _returnString;
}
@end
