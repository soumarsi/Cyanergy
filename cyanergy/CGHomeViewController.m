//
//  CGHomeViewController.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGHomeViewController.h"
#import "UIFont+CGFont.h"

#import "CGAppDelegate.h"
#import "Auditformdetails.h"
#import "AuditImage.h"
#import "Listingtable.h"
#import "FormView.h"

@interface CGHomeViewController (){
    
    CYAuditTopbar *topbar;
    UIImage *MainImage;
    UIActionSheet *sheet;
    NSMutableArray *imgStoreArray;
    UIImageView *dynamicImageView;
    int count,divide;
    UIButton *plusbutton;
    CGFloat latitude,longitude;
    UIButton *crossButton;
    NSArray *pickerData;
    NSString *status;
    CGAppDelegate *cyanergyAppdelegate;
    Auditformdetails *auditFormDetails;
    AuditImage *auditImage;
    Listingtable *Listed;
    FormView *completeForm;
}

@end

@implementation CGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _sideBar = [[CGsidebar alloc]init];
    _sideBar.delegate = self;
    [self.view addSubview:_sideBar];
    
    
    
    //------------CORE LOCATION FOR LAT LONG-------------//
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    //-----------------------------------------------PK--//
    
    cyanergyAppdelegate = (CGAppDelegate *)[[UIApplication sharedApplication]delegate];
    [self datashow];
    
    // Do any additional setup after loading the view.
}

-(void)datashow
{
    
    
    
    self.mainListedArray = [[NSMutableArray alloc]init];
    
    NSManagedObjectContext *manageobjectcontext = [cyanergyAppdelegate managedObjectContext];
    NSFetchRequest *fetchrequst = [[NSFetchRequest alloc]init];
    [fetchrequst setEntity:[NSEntityDescription entityForName:@"Listingtable" inManagedObjectContext:manageobjectcontext]];
    NSError *error;
    NSMutableArray *matchingNames = [[manageobjectcontext executeFetchRequest:fetchrequst error:&error] mutableCopy];
    
    self.mainListedArray = matchingNames;
    
    NSLog(@"-=-=-=-- %lu", (unsigned long)self.mainListedArray.count);
    
    if (self.mainListedArray.count == 0)
    {
        _comingsoon.hidden = NO;
        _listingTable.hidden = YES;
    }
    else
    {
        
        _listingTable.delegate = self;
        _listingTable.dataSource = self;
        _comingsoon.hidden = YES;
        _listingTable.hidden = NO;
    }
    
}
//--------- Location Manager Delegate Methods

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    
    NSLog(@"LAT--------> %f", newLocation.coordinate.latitude);
    NSLog(@"LONG-------> %f", newLocation.coordinate.longitude);
    
    latitude = newLocation.coordinate.latitude;
    longitude = newLocation.coordinate.longitude;
    
    [self.locationManager stopUpdatingLocation];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
     self.navigationController.navigationBarHidden = NO;
    
    UIImage *buttonImage = [UIImage logoImage];
    
    //create the button and assign the image
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:[UIImage logoImage] forState:UIControlStateHighlighted];
    button.adjustsImageWhenDisabled = NO;
    
    //set the frame of the button to the size of the image (see note below)
    button.frame = CGRectMake(20, 0, 230, 40);
    //create a UIBarButtonItem with the button as a custom view
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    self.navigationItem.hidesBackButton = YES;

    self.homeNav = [[RightBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 160.0f, 45.0f)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.homeNav];
   
    self.homeNav.userName.text = @"Jhon Curter";
    
}

-(void)logout
{
    
}

//sidebar delegate method called

-(void)formfunction
{
    self.sideBar.quoteButton.selected = NO;
    self.sideBar.invoiceButton.selected = NO;
    self.sideBar.quoteButton.highlighted = NO;
    self.sideBar.invoiceButton.highlighted = NO;
    self.sideBar.formButton.selected = YES;
    
    _formPopUp = [[CGformpopup alloc]initWithFrame:CGRectMake(300, 300, 345, 345)];
    [self.baseView addSubview:_formPopUp];
    _formPopUp.popupListView.delegate = self;
    _formPopUp.popupListView.dataSource = self;
    

}
-(void)quotefunction
{
    self.sideBar.quoteButton.selected = YES;
    self.sideBar.formButton.selected = NO;
    self.sideBar.invoiceButton.selected = NO;
    self.sideBar.formButton.highlighted = NO;
    self.sideBar.invoiceButton.highlighted = NO;
    
    [_formPopUp removeFromSuperview];
    
    UIView *createExistingView=[[[NSBundle mainBundle] loadNibNamed:@"Formpopup" owner:self options:Nil] objectAtIndex:0];
    CGRect tempRect=[createExistingView frame];
    tempRect.origin.x       =   0.0f;
    tempRect.origin.y       =   121.0f;
    [createExistingView setFrame:tempRect];
     [self.baseView addSubview:createExistingView];

}
-(void)invoicefunction
{
    self.sideBar.formButton.selected = NO;
    self.sideBar.quoteButton.selected = NO;
    self.sideBar.formButton.highlighted = NO;
    self.sideBar.quoteButton.highlighted = NO;
    self.sideBar.invoiceButton.selected = YES;
    [_formPopUp removeFromSuperview];
}
-(void)syncfunction
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
       return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_formPopUp.popupListView.tag == 1)
    {
        return 3;
    }
    return self.mainListedArray.count;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_formPopUp.popupListView.tag == 1)
    {
            DebugLog(@"======numberofsection");
        static NSString *CellIdentifier = @"Formpopup";
        CGformpopupTableViewCell *cell = (CGformpopupTableViewCell *)[_formPopUp.popupListView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (CGformpopupTableViewCell *)[nibArray objectAtIndex:1];
        }
        
        cell.popupNameLabel.text = @"CYANERGY FIELD AUDIT FORM";
         return cell;
    }
    else
    {
            DebugLog(@"======numberofsection2");
        
    CGhomelistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CGhomelistTableViewCell" forIndexPath:indexPath];
        
        Listingtable *list = [self.mainListedArray objectAtIndex:indexPath.row];
        
        cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@",list.customer_fname,list.customer_lname];
        cell.creationdate.text = [NSString stringWithFormat:@"Created on : %@",list.auditform.auditdate];
        cell.type.text = [NSString stringWithFormat:@"Formtype : %@",list.auditform.formtype];
        [cell.pdfshow setTitle:list.auditform.auditimage.auditid forState:UIControlStateNormal];
         return cell;
    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_formPopUp.popupListView.tag == 1){
        
        
        [_formPopUp removeFromSuperview];
        
        if (indexPath.row == 0) {
            
            [self form1];
            _auditForm.generalQuestion1 = @"No";
            _auditForm.generalQuestion2 = @"No";
            _auditForm.generalQuestion3 = @"No";
            _auditForm.generalQuestion4 = @"No";
            _auditForm.generalQuestion5 = @"No";
            _auditForm.generalQuestion6 = @"No";
            _auditForm.generalQuestion7 = @"No";
            _auditForm.generalQuestion8 = @"No";
            _auditForm2.sd15_doorinstall = @"No";
            _auditForm2.sd15_chimneyinstall = @"No";
            _auditForm2.sd15_externaldoorinstall = @"No";
            _auditForm2.sd15_spareproduct = @"No";
            _auditForm2.sd17_showerenergysaving = @"No";
            _auditForm2.sd17_previousshower = @"No";
            _auditForm2.sd17_spareshower = @"No";
            _auditForm2.sd17_installbucket = @"No";
            _auditForm2.sd21b_sensorglobes = @"No";
            _auditForm2.sd21b_emptyglobes = @"No";
            _auditForm2.sd21b_HEglobes = @"No";
            _auditForm2.sd21b_customerglobes = @"No";
            _auditForm2.sd21c_sensorglobes = @"No";
            _auditForm2.sd21c_emptyglobe = @"No";
            _auditForm2.sd21c_heglobes = @"No";
            _auditForm2.sd21c_customerglobe = @"No";
        }
        
        
    }
    
}

//------------------------------FORM 1----------------------------//

-(void)form1{
    
    _check = @"step1";
    
    //-------Setting topbar-------//
    
    
    topbar = [[CYAuditTopbar alloc]init];
    
    CGRect tempRect=[topbar frame];
    tempRect.origin.x       =   121.0f;
    tempRect.origin.y       =   63.0f;
    [topbar setFrame:tempRect];
    [self.baseView addSubview:topbar];
    
    //------Setting to set view frame------//
    
    _auditForm = [[CYAuditForm alloc]init];
    
    CGRect tempRect1=[_auditForm frame];
    tempRect1.origin.x       =   121.0f;
    tempRect1.origin.y       =   103.0f;
    [_auditForm setFrame:tempRect1];
    [self.baseView addSubview:_auditForm];
    
    _auditForm.firstName.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.lastName.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.suburb.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.phone.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.address1.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.address2.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.postcode.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.state.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.installFirstName.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.installLastName.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    
    _auditForm.comment.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm.comment.delegate = self;
    _auditForm.comment.text = @"Give your comment here";
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myKeyboardWillHideHandler:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    [_auditForm.yesNo1 addTarget:self action:@selector(onoff:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm.yesNo2 addTarget:self action:@selector(onoff:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm.yesNo3 addTarget:self action:@selector(onoff:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm.yesNo4 addTarget:self action:@selector(onoff:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm.yesNo5 addTarget:self action:@selector(onoff:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm.yesNo6 addTarget:self action:@selector(onoff:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm.yesNo7 addTarget:self action:@selector(onoff:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm.yesNo8 addTarget:self action:@selector(onoff:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_auditForm.next addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
}

//------------------------FORM 2-------------------//

-(void)form2{
    
    //        [_auditForm removeFromSuperview];  // Not removing bcoz it will be overlapped by form 2
    
    _check = @"step2";
    
    
    //------Setting to set view frame------//
    
    _auditForm2 = [[CYAuditForm2 alloc]init];
    
    CGRect tempRect1=[_auditForm2 frame];
    tempRect1.origin.x       =   121.0f;
    tempRect1.origin.y       =   103.0f;
    [_auditForm2 setFrame:tempRect1];
    [self.baseView addSubview:_auditForm2];
    
    _auditForm2.scrollV.delegate = self;
    [_auditForm2.scrollV setContentSize:CGSizeMake(0, _auditForm2.scrollV.frame.origin.y+_auditForm2.scrollV.frame.size.height+4000)];
    [_auditForm2.scrollV setUserInteractionEnabled:YES];
    
    
    _auditForm2.numField1.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField2.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField3.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField4.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField5.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField6.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField7.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField8.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField9.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField10.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField11.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField12.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField13.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField14.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField15.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField16.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField17.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.numField18.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    
    
    _auditForm2.commentBox1.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox2.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox3.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox4.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox5.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox6.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox7.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox8.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox9.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox10.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox11.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox12.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox13.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox14.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox15.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox16.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox17.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox18.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox19.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox20.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    _auditForm2.commentBox21.layer.borderColor = [[UIColor uniGrayColor] CGColor];
    
    [_auditForm2.yesNo1 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo2 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo3 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo4 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo5 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo6 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo7 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo8 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo9 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo10 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo11 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo12 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo13 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo14 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo15 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.yesNo16 addTarget:self action:@selector(yesno:) forControlEvents:UIControlEventTouchUpInside];
    
    //--------Auditor Status----------//
    
    [_auditForm2.auditStatus1 addTarget:self action:@selector(auditStatus:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.auditStatus2 addTarget:self action:@selector(auditStatus:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.auditStatus3 addTarget:self action:@selector(auditStatus:) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.auditStatus4 addTarget:self action:@selector(auditStatus:) forControlEvents:UIControlEventTouchUpInside];
    
    [_auditForm2.back1 addTarget:self action:@selector(back1) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.next2 addTarget:self action:@selector(next2) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myKeyboardWillHideHandler:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

//------------------------------FORM 3------------------------//

-(void)form3{
    
    _check = @"step3";
    
    DebugLog(@"Casdfghjkjhgfdsdfghjk------> %@",_check);
    
    _auditForm3 = [[CYAuditForm3 alloc]init];
    
    CGRect tempRect2=[_auditForm3 frame];
    tempRect2.origin.x       =   121.0f;
    tempRect2.origin.y       =   103.0f;
    [_auditForm3 setFrame:tempRect2];
    [self.baseView addSubview:_auditForm3];

    
  
    [_auditForm3.scrollV setUserInteractionEnabled:NO];
    
    _auditForm3.latitudeLabel.text = [NSString stringWithFormat:@"%f",latitude];
    _auditForm3.longitudeLabel.text = [NSString stringWithFormat:@"%f",longitude];
    
    _auditForm3.auditorSigView.layer.borderColor = [[UIColor uniGreenColor]CGColor];
    _auditForm3.custSigView.layer.borderColor = [[UIColor uniGreenColor] CGColor];
    
    //----Auditor Signature---//
    
    _auditorsignView= [[ mySmoothLineView alloc] initWithFrame:CGRectMake(0,0,430,170)];
    [_auditorsignView setBackgroundColor:[UIColor clearColor]];
    [_auditForm3.auditorSigView addSubview: _auditorsignView];
    
    //---Customer Signature---//

    _cosumerSignView= [[ mySmoothLineView alloc] initWithFrame:CGRectMake(0,0,430,170)];
    [_cosumerSignView setBackgroundColor:[UIColor clearColor]];
    [_auditForm3.custSigView addSubview:_cosumerSignView];
    
    //--------------------------
    
    [_auditForm3.submit addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm3.back3 addTarget:self action:@selector(back3) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myKeyboardWillHideHandler:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    
}

-(void)addImage{

    
        
        [self startMediaBrowserFromViewController:self usingDelegate:self];

    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if(buttonIndex==actionSheet.cancelButtonIndex){
        
//        [_auditForm3.addImage setHidden:NO];
//        [_auditForm3.addImage setUserInteractionEnabled:YES];
        
        return;
    }
    
//    [self startMediaBrowserFromViewController:self usingDelegate:self];
    
//    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
//    
//    if([UIImagePickerController isSourceTypeAvailable:type]){
//        if(buttonIndex==0 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
//            type = UIImagePickerControllerSourceTypeCamera;
//        }
//        
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.allowsEditing = YES;
//        picker.delegate   = self;
//        picker.sourceType = type;
//
//        [self presentViewController:picker animated:YES completion:nil];
//    
//    }
    
}
-(void)tileFunc{
    
    [dynamicImageView removeFromSuperview];
    [plusbutton removeFromSuperview];
    [crossButton removeFromSuperview];
    
    if (imgStoreArray.count == 0)
    {
        count = imgStoreArray.count % 2;
        divide = imgStoreArray.count / 2.0f;
        
        dynamicImageView = [[UIImageView alloc]init];
        
        dynamicImageView.frame = CGRectMake((8+440)*count+8, (270*divide)+8, 440, 265);
        dynamicImageView.tag = imgStoreArray.count;
        dynamicImageView.backgroundColor = [UIColor clearColor];
        dynamicImageView.layer.borderWidth = 1.0f;
        dynamicImageView.layer.borderColor = [[UIColor grayColor]CGColor];
        [_auditForm3.scrollV addSubview:dynamicImageView];
        dynamicImageView.image = nil;
        
        
        plusbutton = [[UIButton alloc]init];
        [plusbutton setFrame:CGRectMake((8+440)*count+8, (270*divide)+8, 440, 265)];
        [plusbutton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        [plusbutton addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
        [_auditForm3.scrollV addSubview:plusbutton];
        
        
        
        DebugLog(@"FRAME-------->X= %f , Y= %f , WID= %f , HEI= %f",dynamicImageView.frame.origin.x, dynamicImageView.frame.origin.y,dynamicImageView.frame.size.width,dynamicImageView.frame.size.height);
        DebugLog(@"COUNT--------> %d",count);
        
        
        _auditForm3.bottomView.frame = CGRectMake(8.0f, (270*divide)+8+265.0f, 887.0f, 339.0f);
        _auditForm3.scrollV.delegate = self;
        [_auditForm3.scrollV setContentSize:CGSizeMake(0, _auditForm3.bottomView.frame.origin.y+_auditForm3.bottomView.frame.size.height+70)];
        [_auditForm3.scrollV setUserInteractionEnabled:YES];
        
    }
    else
    {
        for (int k = 0; k <= imgStoreArray.count; k++)
        {
            
            NSLog(@"-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=%d",k);
            
            count = k % 2;
            divide = k/ 2.0f;
            
           
            NSLog(@"entry-=-=-=-=-=--=");
            if (imgStoreArray.count == k)
            {
                
                NSLog(@"entry");
                dynamicImageView = [[UIImageView alloc]init];
                dynamicImageView.frame = CGRectMake((8+440)*count+8, (270*divide)+8, 440, 265);
                dynamicImageView.backgroundColor = [UIColor clearColor];
                dynamicImageView.layer.borderWidth = 1.0f;
                dynamicImageView.layer.borderColor = [[UIColor grayColor]CGColor];
                [_auditForm3.scrollV addSubview:dynamicImageView];
                dynamicImageView.image = nil;
                
                
                plusbutton = [[UIButton alloc]init];
                [plusbutton setFrame:CGRectMake((8+440)*count+8, (270*divide)+8, 440, 265)];
                [plusbutton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
                [plusbutton addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
                [_auditForm3.scrollV addSubview:plusbutton];
            }
            else
            {
                
                dynamicImageView = [[UIImageView alloc]init];
                dynamicImageView.frame = CGRectMake((8+440)*count+8, (270*divide)+8, 440, 225);
                dynamicImageView.tag = k;
                dynamicImageView.backgroundColor = [UIColor clearColor];
                dynamicImageView.layer.borderWidth = 1.0f;
                dynamicImageView.contentMode = UIViewContentModeScaleAspectFill;
                dynamicImageView.clipsToBounds = YES;
                dynamicImageView.layer.borderColor = [[UIColor grayColor]CGColor];
                [_auditForm3.scrollV addSubview:dynamicImageView];
                DebugLog(@"DIVIDE--------> %@",[imgStoreArray objectAtIndex:k]);
                dynamicImageView.image =[UIImage imageWithData:[imgStoreArray objectAtIndex:k]];
                
                [plusbutton removeFromSuperview];
                
                crossButton = [[UIButton alloc]init];
                [crossButton setFrame:CGRectMake((8+440)*count+416, (270*divide)+11, 25, 25)];
                [crossButton setBackgroundColor:[UIColor clearColor]];
                [crossButton setImage:[UIImage imageNamed:@"crossBtn"] forState:UIControlStateNormal];
                crossButton.tag = k;
                [crossButton addTarget:self action:@selector(crossimage:) forControlEvents:UIControlEventTouchUpInside];
                [_auditForm3.scrollV addSubview:crossButton];
                crossButton.layer.zPosition = 1000;
                
                
                _imageText = [[UITextField alloc]initWithFrame:CGRectMake((8+440)*count+8, (270*divide)+225+8, 440, 39)];
                [self.imageText setTextAlignment:NSTextAlignmentCenter];
                [self.imageText setTextColor:[UIColor blackColor]];
                [self.imageText setFont:[UIFont imageTextFont]];
                [self.imageText setDelegate:self];
                self.imageText.tag = k;
                self.imageText.layer.borderWidth = 1.0f;
                self.imageText.layer.borderColor = [[UIColor grayColor]CGColor];
                [_auditForm3.scrollV addSubview:_imageText];
            }
            
            
            DebugLog(@"FRAME-------->X= %f , Y= %f , WID= %f , HEI= %f",dynamicImageView.frame.origin.x, dynamicImageView.frame.origin.y,dynamicImageView.frame.size.width,dynamicImageView.frame.size.height);
            DebugLog(@"COUNT--------> %d",count);
            
            
            _auditForm3.bottomView.frame = CGRectMake(8.0f, (270*divide)+8+265.0f, 887.0f, 339.0f);
            _auditForm3.scrollV.delegate = self;
            [_auditForm3.scrollV setContentSize:CGSizeMake(0, _auditForm3.bottomView.frame.origin.y+_auditForm3.bottomView.frame.size.height+70)];
            [_auditForm3.scrollV setUserInteractionEnabled:YES];
        }
    }
}
-(void)crossimage:(UIButton *)sender
{
    
    [imgStoreArray removeObjectAtIndex:sender.tag];
    [_imageTextArray removeObjectAtIndex:sender.tag];
    
    
    NSLog(@"-=-=-=-=--= imagstorearray-=-= %@===== %lu", imgStoreArray,(unsigned long)imgStoreArray.count);
    
    [self next2];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    MainImage= info[UIImagePickerControllerEditedImage];
    
    DebugLog(@"COUNT--------> %ld     %ld",(long)dynamicImageView.tag,(unsigned long)imgStoreArray.count);
    
    [picker dismissViewControllerAnimated:YES completion:Nil];
    
    NSData *imagedata = UIImageJPEGRepresentation(MainImage, 1.0f);
    
    [imgStoreArray addObject:imagedata];
    [self.imageTextArray addObject:@""];
    
    
    
    [self  tileFunc];
    
}

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    mediaUI.delegate = delegate;
    mediaUI.allowsEditing = YES;
    
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:mediaUI];
    popover.delegate=self;
    [popover presentPopoverFromRect:CGRectMake(49, 55, 350, 350) inView:_auditForm3 permittedArrowDirections:0 animated:YES];
    
    return YES;
}
-(void)onoff:(UISwitch *)sender{
    
    
    switch (sender.tag) {
        case 1:
            
            if ([sender isOn]) {
                
                _auditForm.generalQuestion1 = @"Yes";

            }else{
                
                _auditForm.generalQuestion1 = @"No";
            }
            
            break;
            
        case 2:
            
            if ([sender isOn]) {
                
                _auditForm.generalQuestion2 = @"Yes";
                
            }else{
                
                _auditForm.generalQuestion2 = @"No";
                
            }
            break;
            
        case 3:
            
            if ([sender isOn]) {
                
                _auditForm.generalQuestion3 = @"Yes";
                
            }else{
                
                _auditForm.generalQuestion3 = @"No";
                
            }
            break;
            
        case 4:
            
            if ([sender isOn]) {
                
                _auditForm.generalQuestion4 = @"Yes";
                
            }else{
                
                _auditForm.generalQuestion4 = @"No";
                
            }
            break;
            
        case 5:
            
            if ([sender isOn]) {
                
                _auditForm.generalQuestion5 = @"Yes";
                
            }else{
                
                _auditForm.generalQuestion5 = @"No";
                
            }
            break;
            
        case 6:
            
            if ([sender isOn]) {
                
                _auditForm.generalQuestion6 = @"Yes";
                
            }else{
                
                _auditForm.generalQuestion6 = @"No";
                
            }
            break;
            
        case 7:
            
            if ([sender isOn]) {
                
                _auditForm.generalQuestion7 = @"Yes";
                
            }else{
                
                _auditForm.generalQuestion7 = @"No";
                
            }
            break;
            
        case 8:
            
            if ([sender isOn]) {
                
                _auditForm.generalQuestion8 = @"Yes";
                
            }else{
                
                _auditForm.generalQuestion8 = @"No";
                
            }
            break;
            
        default:
            break;
    }

}
-(void)next{
    
    if ([_auditForm.firstName.text isEqualToString:@""]) {
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter your first name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.lastName.text isEqualToString:@""]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter your last name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.suburb.text isEqualToString:@""]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter suburb" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.postcode.text isEqualToString:@""]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter postal code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.address1.text isEqualToString:@""] && [_auditForm.address2.text isEqualToString:@""]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.state.text isEqualToString:@""]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter state" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.installFirstName.text isEqualToString:@""]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter installer first name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.installLastName.text isEqualToString:@""]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter installer last name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.comment.text isEqualToString:@""]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please give comment" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.comment.text isEqualToString:@"Give your comment here"]){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please give comment" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.phone.text isEqualToString:@""]) {
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Phone number cannot be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if(_auditForm.phone.text.length < 10 || _auditForm.phone.text.length >10){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Phone number must be of 10 digits" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if ([_auditForm.phone.text rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound){

        DebugLog(@"This field accepts only numeric entries.");
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please give only numeric value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else{
    
            [self form2];
        
        }
    
}
-(void)next2{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myKeyboardWillHideHandler:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    _imageTextArray = [[NSMutableArray alloc]init];
    imgStoreArray = [[NSMutableArray alloc]init];
    
    [self form3];
    [self tileFunc];
    
}


-(void)yesno:(UISwitch *)sender{
    
    
    switch (sender.tag) {
        case 1:
            
            if ([sender isOn]) {
                
                _auditForm2.sd15_doorinstall = @"Yes";
                
            }else{
                
                _auditForm2.sd15_doorinstall = @"No";
            }
            
            break;
            
        case 2:
            
            if ([sender isOn]) {
                
                _auditForm2.sd15_chimneyinstall = @"Yes";
                
            }else{
                
                _auditForm2.sd15_chimneyinstall = @"No";
                
            }
            break;
            
        case 3:
            
            if ([sender isOn]) {
                
                 _auditForm2.sd15_externaldoorinstall = @"Yes";
                
            }else{
                
                _auditForm2.sd15_externaldoorinstall = @"No";
            }
            break;
            
        case 4:
            
            if ([sender isOn]) {
                
                _auditForm2.sd15_spareproduct = @"Yes";
                
            }else{
                
                _auditForm2.sd15_spareproduct = @"No";
                
            }
            break;
            
        case 5:
            
            if ([sender isOn]) {
                
                _auditForm2.sd17_showerenergysaving = @"Yes";
                
            }else{
                
                _auditForm2.sd17_showerenergysaving = @"No";
                
            }
            break;
            
        case 6:
            
            if ([sender isOn]) {
                
                _auditForm2.sd17_previousshower = @"Yes";
                
            }else{
                
                _auditForm2.sd17_previousshower = @"No";
                
            }
            break;
            
        case 7:
            
            if ([sender isOn]) {
                
                _auditForm2.sd17_spareshower = @"Yes";
                
            }else{
                
                _auditForm2.sd17_spareshower = @"No";
            }
            break;
            
        case 8:
            
            if ([sender isOn]) {
                
                _auditForm2.sd17_installbucket = @"Yes";
                
            }else{
                
                _auditForm2.sd17_installbucket = @"No";
                
            }
            break;
            
        case 9:
            
            if ([sender isOn]) {
                
                _auditForm2.sd21b_sensorglobes = @"Yes";
                
            }else{
                
                _auditForm2.sd21b_sensorglobes = @"No";
            }
            
            break;
            
        case 10:
            
            if ([sender isOn]) {
                
                _auditForm2.sd21b_emptyglobes = @"Yes";
                
            }else{
                
                _auditForm2.sd21b_emptyglobes = @"No";
            }
            break;
            
        case 11:
            
            if ([sender isOn]) {
                
                _auditForm2.sd21b_HEglobes = @"Yes";
                
            }else{
                
                _auditForm2.sd21b_HEglobes = @"No";
            }
            break;
            
        case 12:
            
            if ([sender isOn]) {
                
                _auditForm2.sd21b_customerglobes = @"Yes";
                
            }else{
                
                _auditForm2.sd21b_customerglobes = @"No";
                
            }
            break;

        case 13:
            
            if ([sender isOn]) {
                
                _auditForm2.sd21c_sensorglobes = @"Yes";
                
            }else{
                
                _auditForm2.sd21c_sensorglobes = @"No";
            }
            break;
            
        case 14:
            
            if ([sender isOn]) {
                
                _auditForm2.sd21c_emptyglobe = @"Yes";
            }else{
                
                _auditForm2.sd21c_emptyglobe = @"No";
                
            }
            break;
            
        case 15:
            
            if ([sender isOn]) {
                
                _auditForm2.sd21c_heglobes = @"Yes";
                
            }else{
                
                _auditForm2.sd21c_heglobes = @"No";
                
            }
            break;
            
        case 16:
            
            if ([sender isOn]) {
                
                _auditForm2.sd21c_customerglobe = @"Yes";
                
            }else{
                
                _auditForm2.sd21c_customerglobe = @"No";
                
            }
            break;

            
        default:
            break;
    }
    
}

-(void)back1{
    
    _check  = @"step1";
    
    [_auditForm2 removeFromSuperview];
    
    
}
-(void)back3{
    
    _check = @"step2";
    
    [_auditForm3 removeFromSuperview];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    DebugLog(@"CHECK--------> %@",_check);
    
    if ([_check isEqualToString: @"step1"]) {
        
        CGRect tempRect=[_auditForm frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   -63.0f;
        [_auditForm setFrame:tempRect];
        
    }else if ([_check isEqualToString: @"step2"]) {
        
        CGRect tempRect=[_auditForm2 frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   -63.0f;
        [_auditForm2 setFrame:tempRect];
        
    }else if ([_check isEqualToString: @"step3"]) {
        
        DebugLog(@"CHECK--------> %@",_check);
        
        CGRect tempRect=[_auditForm3 frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   -63.0f;
        [_auditForm3 setFrame:tempRect];
        
        NSLog(@"textfield-=-=- tag %ld-=-=-=%@", (long)textField.tag,self.imageTextArray);
    }
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([_check isEqualToString:@"step3"]) {
        CGRect tempRect=[_auditForm3 frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   103.0f;
        [_auditForm3 setFrame:tempRect];

    [_imageTextArray removeObjectAtIndex:textField.tag];
    [_imageTextArray insertObject:textField.text atIndex:textField.tag];
        
    NSLog(@"imagetextarray--=-=-= %lu", (unsigned long)self.imageTextArray.count);
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        
        CGRect tempRect=[_auditForm frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   103.0f;
        [_auditForm setFrame:tempRect];
        
        
        return NO;
    }
    
    return YES;
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _auditForm.comment.text = @"";
    
    CGRect tempRect=[_auditForm frame];
    tempRect.origin.x       =   121.0f;
    tempRect.origin.y       =   -350.0f;
    [_auditForm setFrame:tempRect];
    
}
- (void) myKeyboardWillHideHandler:(NSNotification *)notification {
    
    
    if ([_check isEqualToString:@"step1"]) {
        
        CGRect tempRect=[_auditForm frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   103.0f;
        [_auditForm setFrame:tempRect];

    }else if ([_check isEqualToString:@"step2"]) {
        
        CGRect tempRect=[_auditForm2 frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   103.0f;
        [_auditForm2 setFrame:tempRect];
        
    }else if ([_check isEqualToString:@"step3"]) {
        
        CGRect tempRect=[_auditForm3 frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   103.0f;
        [_auditForm3 setFrame:tempRect];
        
    }
   
}

-(void)auditStatus:(UIButton *)sender{
    
    //---------Picker---------//
    
    pickerData = @[@"Pass", @"Fail", @"Partially Fail"];
    
    DebugLog(@"Audit Status--------->");
    
    _background = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _background.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5f];
    [self.view addSubview:_background];
    
    _categoryPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.origin.y+[UIScreen mainScreen].bounds.size.height-200, [UIScreen mainScreen].bounds.size.width, 300)];
    _categoryPickerView.backgroundColor = [UIColor whiteColor];
    [_categoryPickerView setDataSource: self];
    [_categoryPickerView setDelegate: self];
    _categoryPickerView.showsSelectionIndicator = YES;
    
    [_categoryPickerView selectRow:0 inComponent:0 animated:YES];
    
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, _categoryPickerView.frame.origin.y-44, [UIScreen mainScreen].bounds.size.width, 44)];
    pickerToolbar.barStyle = UIBarStyleDefault;
    [pickerToolbar sizeToFit];
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(categoryDoneButtonPressed:)];
    doneBtn.tag = sender.tag;
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];


    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(categoryCancelButtonPressed)];
    
    [pickerToolbar setItems:@[cancelBtn,flexSpace, doneBtn] animated:YES];


    
    [_background addSubview:pickerToolbar];
    [_background addSubview:_categoryPickerView];
    
    

   status = [pickerData objectAtIndex:[_categoryPickerView selectedRowInComponent:0]];

    NSLog(@"status-- %@", status);
    //-------------------------------------------------------
    
}

//----------Picker Delegate-----------//

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return pickerData[row];
}

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:pickerData[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    
//    return attString;
//    
//}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    DebugLog(@"did select-----> %@",pickerData[row]);
    
    status = [NSString stringWithFormat:@"%@",pickerData[row]];
}

-(void)categoryCancelButtonPressed{
    
    [_background removeFromSuperview];
    
}
-(void)categoryDoneButtonPressed:(UIButton *)sender{
    
    
    NSLog(@"-=-=-=- Tag %ld", (long)sender.tag);
    
    if (sender.tag == 1) {
        
        [_auditForm2.auditStatus1 setTitle:status forState:UIControlStateNormal];
        
    }else if (sender.tag == 2) {
     
        [_auditForm2.auditStatus2 setTitle:status forState:UIControlStateNormal];
        
    }else if (sender.tag == 3) {
        
        [_auditForm2.auditStatus3 setTitle:status forState:UIControlStateNormal];
        
    }else if (sender.tag == 4) {
        
        [_auditForm2.auditStatus4 setTitle:status forState:UIControlStateNormal];
        
    }else{
        
        if (sender.tag == 1) {
            
            [_auditForm2.auditStatus1 setTitle:@"Select a status" forState:UIControlStateNormal];
            
        }else if (sender.tag == 2) {
            
            [_auditForm2.auditStatus2 setTitle:@"Select a status" forState:UIControlStateNormal];
            
        }else if (sender.tag == 3) {
            
            [_auditForm2.auditStatus3 setTitle:@"Select a status" forState:UIControlStateNormal];
            
        }else if (sender.tag == 4) {
            
            [_auditForm2.auditStatus4 setTitle:@"Select a status" forState:UIControlStateNormal];
            
        }
        
    }
    
    [_background removeFromSuperview];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)submit
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    NSString *string = [formatter stringFromDate:[NSDate date]];
    
    NSDateFormatter *myXMLdateReader = [[NSDateFormatter alloc] init];
    NSDate *dateformet = [myXMLdateReader dateFromString:string];
    
    NSManagedObjectContext *manageobjectcon = [cyanergyAppdelegate managedObjectContext];
    auditFormDetails = [NSEntityDescription insertNewObjectForEntityForName:@"Auditformdetails" inManagedObjectContext:manageobjectcon];
    
    NSManagedObjectContext *manageobjectcon1 = [cyanergyAppdelegate managedObjectContext];
    auditImage = [NSEntityDescription insertNewObjectForEntityForName:@"AuditImage" inManagedObjectContext:manageobjectcon1];
    
    NSManagedObjectContext *manageobjectcon2 = [cyanergyAppdelegate managedObjectContext];
    Listed = [NSEntityDescription insertNewObjectForEntityForName:@"Listingtable" inManagedObjectContext:manageobjectcon2];

    auditFormDetails.userid = [[NSUserDefaults standardUserDefaults]objectForKey:@"userid"];
    auditFormDetails.username = [[NSUserDefaults standardUserDefaults]objectForKey:@"username"];
    auditFormDetails.auditid = @"1";
    auditFormDetails.auditdate = dateformet;
    auditFormDetails.formtype = @"Audit";
    auditFormDetails.consumer_fname = _auditForm.firstName.text;
    auditFormDetails.consumer_lname = _auditForm.lastName.text;
    auditFormDetails.consumer_phno = _auditForm.phone.text;
    auditFormDetails.consumer_pstcode = _auditForm.postcode.text;
    auditFormDetails.consumer_state = _auditForm.state.text;
    auditFormDetails.consumer_suburb = _auditForm.suburb.text;
    auditFormDetails.consumer_addline1 = _auditForm.address1.text;
    auditFormDetails.consumer_addline2 = _auditForm.address2.text;
    auditFormDetails.installer_fname = _auditForm.installFirstName.text;
    auditFormDetails.installer_lname = _auditForm.installLastName.text;
    auditFormDetails.generalquestion1 = _auditForm.generalQuestion1;
    auditFormDetails.generalquestion2 = _auditForm.generalQuestion2;
    auditFormDetails.generalquestion3 = _auditForm.generalQuestion3;
    auditFormDetails.generalquestion4 = _auditForm.generalQuestion4;
    auditFormDetails.generalquestion5 = _auditForm.generalQuestion5;
    auditFormDetails.generalquestion6 = _auditForm.generalQuestion6;
    auditFormDetails.generalquestion7 = _auditForm.generalQuestion7;
    auditFormDetails.generalquestion8 = _auditForm.generalQuestion8;
    auditFormDetails.generalcomment = _auditForm.comment.text;
    
    auditFormDetails.sd15_tnodoorseal = _auditForm2.numField1.text;
    auditFormDetails.sd15_tnochimneyseal = _auditForm2.numField2.text;
    auditFormDetails.sd15_externamdoors = _auditForm2.numField3.text;
    auditFormDetails.sd15_externalchimney = _auditForm2.numField4.text;
    auditFormDetails.sd15_doorinstall = _auditForm2.sd15_doorinstall;
    auditFormDetails.sd15_doorinstallcom = _auditForm2.commentBox3.text;
    auditFormDetails.sd15_chimneyinstall = _auditForm2.sd15_chimneyinstall;
    auditFormDetails.sd15_chimneyinstallcom = _auditForm2.commentBox4.text;
    auditFormDetails.sd15_doorsealremov = _auditForm2.numField5.text;
    auditFormDetails.sd15_chimneysealremov = _auditForm2.numField6.text;
    auditFormDetails.sd15_externaldoorinstall = _auditForm2.sd15_externaldoorinstall;
    auditFormDetails.sd15_externaldoorinstallcom = _auditForm2.commentBox5.text;
    auditFormDetails.sd15_spareproduct = _auditForm2.sd15_spareproduct;
    auditFormDetails.sd15_spareproductcom = _auditForm2.commentBox6.text;
    auditFormDetails.sd15_auditstatus = _auditForm2.auditStatus1.titleLabel.text;
    auditFormDetails.sd15_comment = _auditForm2.commentBox2.text;
    
    auditFormDetails.sd17_totalnoshower = _auditForm2.numField7.text;
    auditFormDetails.sd17_totalnobathroom = _auditForm2.numField8.text;
    auditFormDetails.sd17_showerenergysaving = _auditForm2.sd17_showerenergysaving;
    auditFormDetails.sd17_showerenergycom = _auditForm2.commentBox7.text;
    auditFormDetails.sd17_previousshower = _auditForm2.sd17_previousshower;
    auditFormDetails.sd17_previousshowercom = _auditForm2.commentBox8.text;
    auditFormDetails.sd17_spareshower = _auditForm2.sd17_spareshower;
    auditFormDetails.sd17_spareshowercom = _auditForm2.commentBox9.text;
    auditFormDetails.sd17_installbucket = _auditForm2.sd17_installbucket;
    auditFormDetails.sd17_installbucketcom = _auditForm2.commentBox10.text;
    auditFormDetails.sd17_auditstatus = _auditForm2.auditStatus2.titleLabel.text;
    auditFormDetails.sd17_comment = _auditForm2.commentBox11.text;
    
    auditFormDetails.sd21b_totalnoglobes = _auditForm2.numField9.text;
    auditFormDetails.sd21b_sensorglobes = _auditForm2.sd21b_sensorglobes;
    auditFormDetails.sd21b_sensorglobescom = _auditForm2.commentBox12.text;
    auditFormDetails.sd21b_emptyglobes = _auditForm2.sd21b_emptyglobes;
    auditFormDetails.sd21b_emptyglobescom = _auditForm2.commentBox13.text;
    auditFormDetails.sd21b_HEglobes = _auditForm2.sd21b_HEglobes;
    auditFormDetails.sd21b_HEglobescom = _auditForm2.commentBox14.text;
    auditFormDetails.sd21b_customerglobes = _auditForm2.sd21b_customerglobes;
    auditFormDetails.sd21b_customerglobescom = _auditForm2.commentBox15.text;
    auditFormDetails.sd21b_confirmglobe = _auditForm2.numField10.text;
    auditFormDetails.sd21b_otherglobes = _auditForm2.numField11.text;
    auditFormDetails.sd21b_emptysocket = _auditForm2.numField12.text;
    auditFormDetails.sd21b_installheglobes = _auditForm2.numField13.text;
    auditFormDetails.sd21b_auditstatus = _auditForm2.auditStatus3.titleLabel.text;
    auditFormDetails.sd21b_comment = _auditForm2.commentBox16.text;

    
    auditFormDetails.sd21c_totalnoglobes = _auditForm2.numField18.text;
    auditFormDetails.sd21c_sensorglobes = _auditForm2.sd21c_sensorglobes;
    auditFormDetails.sd21c_sensorglobescom = _auditForm2.commentBox21.text;
    auditFormDetails.sd21c_emptyglobe = _auditForm2.sd21c_emptyglobe;
    auditFormDetails.sd21c_emptyglobecom = _auditForm2.commentBox17.text;
    auditFormDetails.sd21c_heglobes = _auditForm2.sd21c_heglobes;
    auditFormDetails.sd21c_hEglobescom = _auditForm2.commentBox18.text;
    auditFormDetails.sd21c_customerglobe = _auditForm2.sd21c_customerglobe;
    auditFormDetails.sd21c_customerglobecom = _auditForm2.commentBox19.text;
    auditFormDetails.sd21c_confirmglobe = _auditForm2.numField16.text;
    auditFormDetails.sd21c_otherglobe = _auditForm2.numField15.text;
    auditFormDetails.sd21c_emptysocket = _auditForm2.numField14.text;
    auditFormDetails.sd21c_installHEglobe = _auditForm2.numField17.text;
    auditFormDetails.sd21c_auditstatus = _auditForm2.auditStatus4.titleLabel.text;
    auditFormDetails.sd21c_comment = _auditForm2.commentBox20.text;
    
    auditImage.formtype = @"Audit";
    auditImage.auditid = @"1";
    auditImage.gpslatitude = latitude;
    auditImage.gpslongitude = longitude;
    NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:imgStoreArray];
    auditImage.image = arrayData;
    NSData *arrayDatatext = [NSKeyedArchiver archivedDataWithRootObject:_imageTextArray];
    auditImage.imagetext = arrayDatatext;
    
    Listed.formtype = @"Audit";
    Listed.creationdate = dateformet;
    Listed.customer_fname =_auditForm.firstName.text;
    Listed.customer_lname = _auditForm.lastName.text;
    
    auditFormDetails.auditimage = auditImage;
    Listed.auditform = auditFormDetails;
    
    [cyanergyAppdelegate saveContext];
    
    [self fillForm];
    
    [self mainView];
    
}

-(void)fillForm{
    
    completeForm.auditor_name_lbl.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"username"];
    completeForm.first_name_lbl.text = _auditForm.firstName.text;
    completeForm.last_name_lbl.text = _auditForm.lastName.text;
    completeForm.subrub_lbl.text = _auditForm.suburb.text;
    completeForm.ph_no_lbl.text = _auditForm.phone.text;
    completeForm.add1_lbl.text = _auditForm.address1.text;
    completeForm.add2_lbl.text = _auditForm.address2.text;
    completeForm.post_code_lbl.text = _auditForm.postcode.text;
    completeForm.state_lbl.text = _auditForm.state.text;
    completeForm.installer_first_name.text = _auditForm.installFirstName.text;
    completeForm.installer_last_name_lbl.text = _auditForm.installLastName.text;
    completeForm.gen_qus1_yesNo_lbl.text = _auditForm.generalQuestion1;
    completeForm.gen_qus2_yesNo_lbl.text = _auditForm.generalQuestion2;
    completeForm.gen_qus3_yesNo_lbl.text = _auditForm.generalQuestion3;
    completeForm.gen_qus4_yesNo_lbl.text = _auditForm.generalQuestion4;
    completeForm.gen_qus5_yesNo_lbl.text = _auditForm.generalQuestion5;
    completeForm.gen_qus6_yesNo_lbl.text = _auditForm.generalQuestion6;
    completeForm.gen_qus7_yesNo_lbl.text = _auditForm.generalQuestion7;
    completeForm.gen_qus8_yesNo_lbl.text = _auditForm.generalQuestion8;
    completeForm.gen_qus_comment_tview.text = _auditForm.comment.text;
    
    completeForm.schedule15_qus1_yesNo_lbl.text = _auditForm2.numField1.text;
    completeForm.schedule15_qus2_yesNo_lbl.text = _auditForm2.numField2.text;
    completeForm.schedule15_qus3_yesNo_lbl.text = _auditForm2.numField3.text;
    completeForm.schedule15_qus4_yesNo_lbl.text = _auditForm2.numField4.text;
    completeForm.schedule15_qus5_yesNo_lbl.text = _auditForm2.sd15_doorinstall;
    completeForm.schedule15_qus5_comment_tview.text = _auditForm2.commentBox3.text;
    completeForm.schedule15_qus6_yesNo_lbl.text = _auditForm2.sd15_chimneyinstall;
    completeForm.schedule15_qus6_comment_tview.text = _auditForm2.commentBox4.text;
    completeForm.schedule15_qus7_yesNo_lbl.text = _auditForm2.numField5.text;
    completeForm.schedule15_qus8_yesNo_lbl.text = _auditForm2.numField6.text;
    completeForm.schedule15_qus9_yesNo_lbl.text = _auditForm2.sd15_externaldoorinstall;
    completeForm.schedule15_qus9_comment_tview.text = _auditForm2.commentBox5.text;
    completeForm.schedule15_qus10_yesNo_lbl.text = _auditForm2.sd15_spareproduct;
     completeForm.schedule15_qus10_comment_tview.text = _auditForm2.commentBox6.text;
    completeForm.schedule15_auditStatus_yesNo_lbl.text = _auditForm2.auditStatus1.titleLabel.text;
    completeForm.schedule15_auditStatus_comment_tview.text = _auditForm2.commentBox2.text;
    
    completeForm.schedule17_qus1_yesNo_lbl.text = _auditForm2.numField7.text;
    completeForm.schedule17_qus2_yesNo_lbl.text = _auditForm2.numField8.text;
    completeForm.schedule17_qus3_yesNo_lbl.text = _auditForm2.sd17_showerenergysaving;
    completeForm.schedule17_qus3_comment_tview.text = _auditForm2.commentBox7.text;
    completeForm.schedule17_qus4_yesNo_lbl.text = _auditForm2.sd17_previousshower;
    completeForm.schedule17_qus4_comment_tview.text = _auditForm2.commentBox8.text;
    completeForm.schedule17_qus25_yesNo_lbl.text = _auditForm2.sd17_spareshower;
    completeForm.schedule17_qus5_comment_tview.text = _auditForm2.commentBox9.text;
    completeForm.schedule17_qus6_yesNo_lbl.text = _auditForm2.sd17_installbucket;
    completeForm.schedule17_qus6_comment_tview.text = _auditForm2.commentBox10.text;
    completeForm.schedule17_auditStatus_yesNo_lbl.text = _auditForm2.auditStatus2.titleLabel.text;
    completeForm.schedule17_auditStatus_comment_tview.text = _auditForm2.commentBox11.text;
    
    completeForm.schedule21B_qus1_yesNo_lbl.text = _auditForm2.numField9.text;
    completeForm.schedule21B_qus2_yesNo_lbl.text = _auditForm2.sd21b_sensorglobes;
    completeForm.schedule21B_qus2_comment_tview.text = _auditForm2.commentBox12.text;
    completeForm.schedule21B_qus3_yesNo_lbl.text = _auditForm2.sd21b_emptyglobes;
    completeForm.schedule21B_qus3_comment_tview.text = _auditForm2.commentBox13.text;
    completeForm.schedule21B_qus4_yesNo_lbl.text = _auditForm2.sd21b_HEglobes;
    completeForm.schedule21B_qus4_comment_tview.text = _auditForm2.commentBox14.text;
    completeForm.schedule21B_qus5_yesNo_lbl.text = _auditForm2.sd21b_customerglobes;;
    completeForm.schedule21B_qus5_comment_tview.text = _auditForm2.commentBox15.text;
    completeForm.schedule21B_qus6_yesNo_lbl.text = _auditForm2.numField10.text;
    completeForm.schedule21B_qus7_yesNo_lbl.text = _auditForm2.numField11.text;
    completeForm.schedule21B_qus8_yesNo_lbl.text = _auditForm2.numField12.text;
    completeForm.schedule21B_qus9_yesNo_lbl.text = _auditForm2.numField13.text;
    completeForm.schedule21B_auditStatus_yesNo_lbl.text = _auditForm2.auditStatus3.titleLabel.text;
    completeForm.schedule21B_auditStatus_comment_tview.text = _auditForm2.commentBox16.text;

    completeForm.schedule21C_qus1_yesNo_lbl.text = _auditForm2.numField8.text;
    completeForm.schedule21C_qus2_yesNo_lbl.text = _auditForm2.sd21c_sensorglobes;
    completeForm.schedule21C_qus2_comment_tview.text = _auditForm2.commentBox21.text;
    completeForm.schedule21C_qus3_yesNo_lbl.text = _auditForm2.sd21c_emptyglobe;
    completeForm.schedule21C_qus3_comment_tview.text = _auditForm2.commentBox17.text;
    completeForm.schedule21C_qus4_yesNo_lbl.text = _auditForm2.sd21c_heglobes;
    completeForm.schedule21C_qus4_comment_tview.text = _auditForm2.commentBox18.text;
    completeForm.schedule21C_qus5_yesNo_lbl.text = _auditForm2.sd21c_customerglobe;
    completeForm.schedule21C_qus5_comment_tview.text = _auditForm2.commentBox19.text;
    completeForm.schedule21C_qus6_yesNo_lbl.text = _auditForm2.numField16.text;
    completeForm.schedule21C_qus7_yesNo_lbl.text = _auditForm2.numField15.text;
    completeForm.schedule21C_qus8_yesNo_lbl.text = _auditForm2.numField14.text;
    completeForm.schedule21C_qus9_yesNo_lbl.text = _auditForm2.numField17.text;
    completeForm.schedule21C_auditStatus_yesNo_lbl.text = _auditForm2.auditStatus4.titleLabel.text;
    completeForm.schedule21C_auditStatus_comment_tview.text = _auditForm2.commentBox20.text;
    
    
}

-(void)mainView
{
    
    [_auditForm removeFromSuperview];
    [_auditForm2 removeFromSuperview];
    [_auditForm3 removeFromSuperview];
    [topbar removeFromSuperview];
    [_formPopUp removeFromSuperview];
    
    [self datashow];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
