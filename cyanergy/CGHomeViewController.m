//
//  CGHomeViewController.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 18/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGHomeViewController.h"
#import "UIFont+CGFont.h"
#import "CGAuditViewController.h"
#import "CGAppDelegate.h"

@interface CGHomeViewController (){
    

   CGFloat latitude,longitude;
    CGAppDelegate *cyanergyAppdelegate;
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
        
        [_listingTable reloadData];
    }
    
}
//--------- Location Manager Delegate Methods

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{

    
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
//    self.sideBar.quoteButton.selected = YES;
//    self.sideBar.formButton.selected = NO;
//    self.sideBar.invoiceButton.selected = NO;
//    self.sideBar.formButton.highlighted = NO;
//    self.sideBar.invoiceButton.highlighted = NO;
//    
//    [_formPopUp removeFromSuperview];
//    
//    UIView *createExistingView=[[[NSBundle mainBundle] loadNibNamed:@"Formpopup" owner:self options:Nil] objectAtIndex:0];
//    CGRect tempRect=[createExistingView frame];
//    tempRect.origin.x       =   0.0f;
//    tempRect.origin.y       =   121.0f;
//    [createExistingView setFrame:tempRect];
//     [self.baseView addSubview:createExistingView];

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
    else if(tableView.tag == 2)
    {
            DebugLog(@"======numberofsection2");
        
    CGhomelistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CGhomelistTableViewCell" forIndexPath:indexPath];
        
        Listingtable *list = [self.mainListedArray objectAtIndex:indexPath.row];
        
        cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@",list.customer_fname,list.customer_lname];
        cell.creationdate.text = [NSString stringWithFormat:@"Created on : %@",list.auditform.auditdate];
        cell.type.text = [NSString stringWithFormat:@"Formtype : %@",list.auditform.formtype];
        [cell.pdfshow setTitle:@"PDF file" forState:UIControlStateNormal];
         return cell;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_formPopUp.popupListView.tag == 1){
        
        
        [_formPopUp removeFromSuperview];
        
        if (indexPath.row == 0) {
            
   
            
            CGHomeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CGAuditViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            
          
        }
        
        
    }
    else
    {
        
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
