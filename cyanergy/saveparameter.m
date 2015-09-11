//
//  saveparameter.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 08/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "saveparameter.h"
#define App_Domain_Url @"http://esolz.co.in/lab6/cyanergy/webservice/"
#define saveurl @"action.php?mode=save"
@implementation saveparameter

-(NSString *)savestring:(Listingtable *)saveArray
{
    return _returnString;
}

//save data to server
-(void)saveparameterstr:(Listingtable *)saveArray withblock:(Urlresponceblock) responce
{
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",App_Domain_Url,saveurl]]];
    [request setRequestMethod:@"POST"];
   //general details//
    [request addPostValue:saveArray.auditform.userid forKey:@"userid"];
    [request addPostValue:saveArray.auditform.username forKey:@"username"];
    [request addPostValue:saveArray.auditform.auditid forKey:@"auditid"];
    [request addPostValue:saveArray.auditform.auditdate forKey:@"auditdate"];
    [request addPostValue:saveArray.auditform.formtype forKey:@"formtype"];
    [request addPostValue:saveArray.auditform.consumer_fname forKey:@"consumer_fname"];
    [request addPostValue:saveArray.auditform.consumer_lname forKey:@"consumer_lname"];
    [request addPostValue:saveArray.auditform.consumer_phno forKey:@"consumer_phno"];
    [request addPostValue:saveArray.auditform.consumer_pstcode forKey:@"consumer_pstcode"];
    [request addPostValue:saveArray.auditform.consumer_state forKey:@"consumer_state"];
    [request addPostValue:saveArray.auditform.consumer_suburb forKey:@"consumer_suburb"];
    [request addPostValue:saveArray.auditform.consumer_addline1 forKey:@"consumer_addline1"];
    [request addPostValue:saveArray.auditform.consumer_addline2 forKey:@"consumer_addline2"];
    [request addPostValue:saveArray.auditform.installer_fname forKey:@"installer_fname"];
    [request addPostValue:saveArray.auditform.installer_lname forKey:@"installer_lname"];
    [request addPostValue:saveArray.auditform.generalquestion1 forKey:@"generalquestion1"];
    [request addPostValue:saveArray.auditform.generalquestion2 forKey:@"generalquestion2"];
    [request addPostValue:saveArray.auditform.generalquestion3 forKey:@"generalquestion3"];
    [request addPostValue:saveArray.auditform.generalquestion4 forKey:@"generalquestion4"];
    [request addPostValue:saveArray.auditform.generalquestion5 forKey:@"generalquestion5"];
    [request addPostValue:saveArray.auditform.generalquestion6 forKey:@"generalquestion6"];
    [request addPostValue:saveArray.auditform.generalquestion7 forKey:@"generalquestion7"];
    [request addPostValue:saveArray.auditform.generalquestion8 forKey:@"generalquestion8"];
    [request addPostValue:saveArray.auditform.generalcomment forKey:@"generalcomment"];
//sedule 15//
    [request addPostValue:saveArray.auditform.sd15_tnodoorseal forKey:@"sd15_tnodoorseal"];
    [request addPostValue:saveArray.auditform.sd15_tnochimneyseal forKey:@"sd15_tnochimneyseal"];
    [request addPostValue:saveArray.auditform.sd15_externamdoors forKey:@"sd15_externamdoors"];
    [request addPostValue:saveArray.auditform.sd15_externalchimney forKey:@"sd15_externalchimney"];
    [request addPostValue:saveArray.auditform.sd15_doorinstall forKey:@"sd15_doorinstall"];
    [request addPostValue:saveArray.auditform.sd15_doorinstallcom forKey:@"sd15_doorinstallcom"];
    [request addPostValue:saveArray.auditform.sd15_chimneyinstall forKey:@"sd15_chimneyinstall"];
    [request addPostValue:saveArray.auditform.sd15_chimneyinstallcom forKey:@"sd15_chimneyinstallcom"];
    [request addPostValue:saveArray.auditform.sd15_doorsealremov forKey:@"sd15_doorsealremov"];
    [request addPostValue:saveArray.auditform.sd15_externaldoorinstall forKey:@"sd15_externaldoorinstall"];
    [request addPostValue:saveArray.auditform.sd15_externaldoorinstallcom forKey:@"sd15_externaldoorinstallcom"];
    [request addPostValue:saveArray.auditform.sd15_spareproduct forKey:@"sd15_spareproduct"];
    [request addPostValue:saveArray.auditform.sd15_spareproductcom forKey:@"sd15_spareproductcom"];
    [request addPostValue:saveArray.auditform.sd15_auditstatus forKey:@"sd15_auditstatus"];
    [request addPostValue:saveArray.auditform.sd15_comment forKey:@"sd15_comment"];
//sedule 17//
    [request addPostValue:saveArray.auditform.sd17_totalnoshower forKey:@"sd17_totalnoshower"];
    [request addPostValue:saveArray.auditform.sd17_totalnobathroom forKey:@"sd17_totalnobathroom"];
    [request addPostValue:saveArray.auditform.sd17_showerenergysaving forKey:@"sd17_showerenergysaving"];
    [request addPostValue:saveArray.auditform.sd17_showerenergycom forKey:@"sd17_showerenergycom"];
    [request addPostValue:saveArray.auditform.sd17_previousshower forKey:@"sd17_previousshower"];
    [request addPostValue:saveArray.auditform.sd17_previousshowercom forKey:@"sd17_previousshowercom"];
    [request addPostValue:saveArray.auditform.sd17_spareshower forKey:@"sd17_spareshower"];
    [request addPostValue:saveArray.auditform.sd17_installbucket forKey:@"sd17_installbucket"];
    [request addPostValue:saveArray.auditform.sd17_installbucketcom forKey:@"sd17_installbucketcom"];
    [request addPostValue:saveArray.auditform.sd17_auditstatus forKey:@"sd17_auditstatus"];
    [request addPostValue:saveArray.auditform.sd17_comment forKey:@"sd17_comment"];
//sedule 21b//
    [request addPostValue:saveArray.auditform.sd21b_totalnoglobes forKey:@"sd21b_totalnoglobes"];
    [request addPostValue:saveArray.auditform.sd21b_sensorglobes forKey:@"sd21b_sensorglobes"];
    [request addPostValue:saveArray.auditform.sd21b_sensorglobescom forKey:@"sd21b_sensorglobescom"];
    [request addPostValue:saveArray.auditform.sd21b_emptyglobes forKey:@"sd21b_emptyglobes"];
    [request addPostValue:saveArray.auditform.sd21b_emptyglobescom forKey:@"sd21b_emptyglobescom"];
    [request addPostValue:saveArray.auditform.sd21b_HEglobes forKey:@"sd21b_HEglobes"];
    [request addPostValue:saveArray.auditform.sd21b_HEglobescom forKey:@"sd21b_HEglobescom"];
    [request addPostValue:saveArray.auditform.sd21b_customerglobes forKey:@"sd21b_customerglobes"];
    [request addPostValue:saveArray.auditform.sd21b_customerglobescom forKey:@"sd21b_customerglobescom"];
    [request addPostValue:saveArray.auditform.sd21b_confirmglobe forKey:@"sd21b_confirmglobe"];
    [request addPostValue:saveArray.auditform.sd21b_otherglobes forKey:@"sd21b_otherglobes"];
    [request addPostValue:saveArray.auditform.sd21b_emptysocket forKey:@"sd21b_emptysocket"];
    [request addPostValue:saveArray.auditform.sd21b_installheglobes forKey:@"sd21b_installheglobes"];
    [request addPostValue:saveArray.auditform.sd21b_auditstatus forKey:@"sd21b_auditstatus"];
    [request addPostValue:saveArray.auditform.sd21b_comment forKey:@"sd21b_comment"];
    //sedule 21c//
    [request addPostValue:saveArray.auditform.sd21b_totalnoglobes forKey:@"sd21c_totalnoglobes"];
    [request addPostValue:saveArray.auditform.sd21b_sensorglobes forKey:@"sd21c_sensorglobes"];
    [request addPostValue:saveArray.auditform.sd21b_sensorglobescom forKey:@"sd21c_sensorglobescom"];
    [request addPostValue:saveArray.auditform.sd21b_emptyglobes forKey:@"sd21c_emptyglobe"];
    [request addPostValue:saveArray.auditform.sd21b_emptyglobescom forKey:@"sd21c_emptyglobecom"];
    [request addPostValue:saveArray.auditform.sd21b_HEglobes forKey:@"sd21c_heglobes"];
    [request addPostValue:saveArray.auditform.sd21b_HEglobescom forKey:@"sd21c_hEglobescom"];
    [request addPostValue:saveArray.auditform.sd21b_customerglobes forKey:@"sd21c_customerglobe"];
    [request addPostValue:saveArray.auditform.sd21b_customerglobescom forKey:@"sd21c_customerglobecom"];
    [request addPostValue:saveArray.auditform.sd21b_confirmglobe forKey:@"sd21c_confirmglobe"];
    [request addPostValue:saveArray.auditform.sd21b_otherglobes forKey:@"sd21c_otherglobe"];
    [request addPostValue:saveArray.auditform.sd21b_emptysocket forKey:@"sd21c_emptysocket"];
    [request addPostValue:saveArray.auditform.sd21b_installheglobes forKey:@"sd21c_installHEglobe"];
    [request addPostValue:saveArray.auditform.sd21b_auditstatus forKey:@"sd21c_auditstatus"];
    [request addPostValue:saveArray.auditform.sd21b_comment forKey:@"sd21c_comment"];
    
    //imagedetails//
    [request addPostValue:[NSString stringWithFormat:@"%f",saveArray.auditform.auditimage.gpslatitude] forKey:@"gpslatitude"];
    [request addPostValue:[NSString stringWithFormat:@"%f",saveArray.auditform.auditimage.gpslongitude] forKey:@"gpslongitude"];
    
    //post image data//
    [request addData:saveArray.auditform.auditimage.auditorsignature withFileName:@"signature.jpg" andContentType:@"signature/jpeg" forKey:@"auditorsignature"];
    [request addData:saveArray.auditform.auditimage.customersignature withFileName:@"customersignature.jpg" andContentType:@"customersignature/jpeg" forKey:@"customersignature"];
    [request addData:saveArray.pdfdata withFileName:@"auditpdf.pdf" andContentType:@"audit/pdf" forKey:@"pdfdata"];
    [request setDelegate:self];
    [request startAsynchronous];
    _responce=[responce copy];
//    NSString *response = [NSString stringWithContentsOfFile: [request downloadDestinationPath] encoding:[request responseEncoding] error:nil];
//    DebugLog(@"-=-=: %@",response);
    
}
- (void) requestFinished:(ASIHTTPRequest *)request
{
    NSError *error;
    NSDictionary *saveresult = [NSJSONSerialization JSONObjectWithData:[request responseData] options:kNilOptions error:&error];
    _responce (saveresult,nil);
    
    NSLog(@"Response %d : %@ : %@", request.responseStatusCode, [request responseData],saveresult);
}

- (void) requestStarted:(ASIHTTPRequest *) request
{
    NSLog(@"request started...");
}

- (void) requestFailed:(ASIHTTPRequest *) request
{
    NSError *error = [request error];
    NSLog(@"%@", error);
}

@end
