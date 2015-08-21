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


@interface CGHomeViewController ()<Homeviewcontroller,cgsidebar,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIAlertViewDelegate,UIScrollViewDelegate>{
    
    CYAuditTopbar *topbar;
    
}


@end

@implementation CGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _sideBar = [[CGsidebar alloc]init];
    _sideBar.delegate = self;
    [self.view addSubview:_sideBar];

   
    
  
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
    
//        [_auditForm removeFromSuperview];  // Not removing bcoz it will be overlapped by form 2
        
        _check = @"step2";
        
        topbar = [[CYAuditTopbar alloc]init];
        
        CGRect tempRect=[topbar frame];
        tempRect.origin.x       =   121.0f;
        tempRect.origin.y       =   63.0f;
        [topbar setFrame:tempRect];
        [self.baseView addSubview:topbar];
        
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
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(myKeyboardWillHideHandler:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];

        
        }
    
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
    
//    [self form1];
    
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
        tempRect.origin.y       =   63.0f;
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
        tempRect.origin.y       =   63.0f;
        [_auditForm setFrame:tempRect];

    }
   
}

//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//    
//    if([text isEqualToString:@"\n"]) {
//        [textView resignFirstResponder];
//        
//        CGRect tempRect=[_auditForm frame];
//        tempRect.origin.x       =   121.0f;
//        tempRect.origin.y       =   63.0f;
//        [_auditForm setFrame:tempRect];
//
//        
//        return NO;
//    }
//    
//    return YES;
//}

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
