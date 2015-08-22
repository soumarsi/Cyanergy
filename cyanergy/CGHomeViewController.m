//
//  CGHomeViewController.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGHomeViewController.h"
#import "UIImage+CGimage.h"
#import "CGhomelistTableViewCell.h"
#import "CYAuditTopbar.h"
#import "UIColor+CGColor.h"

#define xPoint = 0;
#define xPointPlus = 5;
#define yPoint = 0;
#define yPointPlus = 8;


@interface CGHomeViewController ()<Homeviewcontroller,cgsidebar,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIAlertViewDelegate,UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIPopoverControllerDelegate>{
    
    CYAuditTopbar *topbar;
    UIImage *MainImage;
    UIActionSheet *sheet;
    NSMutableArray *imgStoreArray;
    UIImageView *dynamicImageView;
    int count,divide;
    UIButton *plusbutton;
}


@end

@implementation CGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _sideBar = [[CGsidebar alloc]init];
    _sideBar.delegate = self;
    [self.view addSubview:_sideBar];

    imgStoreArray = [[NSMutableArray alloc]init];
    
    [self tileFunc];
    
  
//    _formPopUp = [[CGformpopup alloc]init];
//    [self.baseView addSubview:_formPopUp];
//    [_formPopUp setHidden:YES];
    
  //  [_formPopUp.popupListView registerClass:[CGformpopupTableViewCell class] forCellWithReuseIdentifier:@"CGformpopupTableViewCell"];
    
    // Do any additional setup after loading the view.
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
    
 //[_formPopUp setHidden:NO];
    
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
    return 20;    //count number of row from counting array hear cataGorry is An Array
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
         return cell;
    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_formPopUp.popupListView.tag == 1){
        
        
        [_formPopUp removeFromSuperview];
        
        if (indexPath.row == 0) {
            
            [self form1];
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
    
    
    
    [_auditForm2.back1 addTarget:self action:@selector(back1) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm2.next2 addTarget:self action:@selector(next2) forControlEvents:UIControlEventTouchUpInside];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myKeyboardWillHideHandler:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

//------------------------------FORM 3------------------------//

-(void)form3{
    
    _check = @"step2";
    

    _auditForm3 = [[CYAuditForm3 alloc]init];
    
    CGRect tempRect2=[_auditForm3 frame];
    tempRect2.origin.x       =   121.0f;
    tempRect2.origin.y       =   103.0f;
    [_auditForm3 setFrame:tempRect2];
    [self.baseView addSubview:_auditForm3];

    
  
    [_auditForm3.scrollV setUserInteractionEnabled:NO];
    
    
    [_auditForm3.addImage addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm3.submit addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm3.back3 addTarget:self action:@selector(back3) forControlEvents:UIControlEventTouchUpInside];

    
}

-(void)addImage{
    
    [_auditForm3.addImage setHidden:YES];
    [_auditForm3.addImage setUserInteractionEnabled:NO];
    
    [self startMediaBrowserFromViewController:self usingDelegate:self];
    
//    sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil];
//    [sheet showInView:_auditForm3];

    
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if(buttonIndex==actionSheet.cancelButtonIndex){
        
        [_auditForm3.addImage setHidden:NO];
        [_auditForm3.addImage setUserInteractionEnabled:YES];
        
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
    
    count = imgStoreArray.count % 2;
    divide = imgStoreArray.count / 2.0f;
    
    dynamicImageView = [[UIImageView alloc]init];
    
    dynamicImageView.frame = CGRectMake((8+440)*count+8, (270*divide)+8, 440, 265);
    dynamicImageView.tag = imgStoreArray.count;
    dynamicImageView.backgroundColor = [UIColor clearColor];
    dynamicImageView.layer.borderWidth = 1.0f;
    dynamicImageView.layer.borderColor = [[UIColor grayColor]CGColor];
    [_auditForm3.scrollV addSubview:dynamicImageView];
    
    
    plusbutton = [[UIButton alloc]init];
    [plusbutton setFrame:CGRectMake((8+440)*count+8, (270*divide)+8, 440, 265)];
    [plusbutton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [plusbutton addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
    [_auditForm3.scrollV addSubview:plusbutton];
    
    DebugLog(@"FRAME-------->X= %f , Y= %f , WID= %f , HEI= %f",dynamicImageView.frame.origin.x, dynamicImageView.frame.origin.y,dynamicImageView.frame.size.width,dynamicImageView.frame.size.height);
    DebugLog(@"COUNT--------> %d",count);
    DebugLog(@"DIVIDE--------> %d",divide);
    
//    _auditForm3.bottomView.frame = cgrect;
    
    _auditForm3.bottomView.frame = CGRectMake(8.0f, (270*divide)+8+265.0f, 887.0f, 339.0f);
    
    
    _auditForm3.scrollV.delegate = self;
    [_auditForm3.scrollV setContentSize:CGSizeMake(0, _auditForm3.bottomView.frame.origin.y+_auditForm3.bottomView.frame.size.height+70)];
    [_auditForm3.scrollV setUserInteractionEnabled:YES];
    
    
    
    
    
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    MainImage= info[UIImagePickerControllerEditedImage];
    
    DebugLog(@"COUNT--------> %ld     %ld",(long)dynamicImageView.tag,imgStoreArray.count);
    
    
    if (dynamicImageView.tag == imgStoreArray.count)
    {
        dynamicImageView.image =MainImage;
        [plusbutton removeFromSuperview];
    }
        [picker dismissViewControllerAnimated:YES completion:Nil];
    
    [imgStoreArray addObject:MainImage];
    
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
    [popover presentPopoverFromRect:CGRectMake(10, 55, 350, 350) inView:_auditForm3 permittedArrowDirections:Nil animated:YES];
    
    return YES;
}
-(void)onoff:(UISwitch *)sender{
    
    
    switch (sender.tag) {
        case 1:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");

            }else{
                
                DebugLog(@"ascheeeee============>OFF");

            }
            
            break;
            
        case 2:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 3:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 4:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 5:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 6:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 7:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 8:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        default:
            break;
    }

}
-(void)next{
    
    if ([_auditForm.phone.text isEqualToString:@""]) {
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Phone number cannot be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else if(_auditForm.phone.text.length < 10){
        
        _alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Phone number must be of 10 digits" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [_alertView show];
        
    }else{
    
            [self form2];
        
        }
    
}
-(void)next2{
    
    [self form3];
    [self tileFunc];
    
}
-(void)submit{
    
    DebugLog(@"SUBMIT------------>");
    
}

-(void)yesno:(UISwitch *)sender{
    
    
    switch (sender.tag) {
        case 1:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            
            break;
            
        case 2:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 3:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 4:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 5:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 6:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 7:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 8:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 9:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            
            break;
            
        case 10:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 11:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 12:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 13:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 14:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 15:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;
            
        case 16:
            DebugLog(@"ascheeeee============>%ld",(long)sender.tag);
            
            if ([sender isOn]) {
                
                DebugLog(@"ascheeeee============>ON");
                
            }else{
                
                DebugLog(@"ascheeeee============>OFF");
                
            }
            break;

            
        default:
            break;
    }
    
}

-(void)back1{
    
    [_auditForm2 removeFromSuperview];
    
    
}
-(void)back3{
    
    [_auditForm3 removeFromSuperview];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    CGRect tempRect=[_auditForm frame];
    tempRect.origin.x       =   121.0f;
    tempRect.origin.y       =   -63.0f;
    [_auditForm setFrame:tempRect];
    
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

    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
