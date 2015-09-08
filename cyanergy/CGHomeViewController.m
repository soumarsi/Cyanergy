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
#import "UYLGenericPrintPageRenderer.h"
@interface CGHomeViewController (){
    
    UIView *lView;
   CGFloat latitude,longitude;
    CGAppDelegate *cyanergyAppdelegate;
    NSMutableData *pdfData;
    Listingtable *list;
}

@end

@implementation CGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _sideBar = [[CGsidebar alloc]init];
    _sideBar.delegate = self;
    [self.view addSubview:_sideBar];
    
    
    _saveClass = [[saveparameter alloc]init];
    _globalClass = [[CGglobalfunction alloc]init];
    
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
    DebugLog(@"logout");
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CGHomeViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CGLoginViewController"];
    [self.navigationController pushViewController:vc animated:YES];
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

    if (self.mainListedArray.count != 0)
    {
        Listingtable *listArray = [self.mainListedArray objectAtIndex:0];
        
        NSString * params = [_saveClass savestring:listArray];
        
       // DebugLog(@"-=-=-=-=sync data-=-=-=- : %@", params);
        
        [_globalClass saveparameterstr:params withblock:^(id result, NSError *error) {
            
            NSLog(@"-=-=-=-%@ ", result);
           
            if ([[result objectForKey:@"message"] isEqualToString:@"success"])
            {
                NSIndexPath *myIP = [NSIndexPath indexPathForRow:0 inSection:0];
                [self.mainListedArray removeObjectAtIndex:0];
                [self.listingTable beginUpdates];
                [self.listingTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:myIP] withRowAnimation:UITableViewRowAnimationLeft];
                [self.listingTable endUpdates];
                
                
                [self performSelector:@selector(syncfunction) withObject:nil afterDelay:1.0f];
            }
        }];
        
    }
    else
    {
        NSManagedObjectContext *context3=[cyanergyAppdelegate managedObjectContext];
        NSFetchRequest *allCars = [[NSFetchRequest alloc] init];
        [allCars setEntity:[NSEntityDescription entityForName:@"Listingtable" inManagedObjectContext:context3]];
        [allCars setIncludesPropertyValues:NO]; //only fetch the managedObjectID
        
        NSError *error = nil;
        NSArray *cars = [context3 executeFetchRequest:allCars error:&error];
        //error handling goes here
        for (NSManagedObject *car in cars) {
            [context3 deleteObject:car];
        }
        NSError *saveError = nil;
        [context3 save:&saveError];
        
        _comingsoon.hidden = NO;
        _listingTable.hidden = YES;
        //more error handling here
    }
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
        
        list = [self.mainListedArray objectAtIndex:indexPath.row];
        
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
        list = [self.mainListedArray objectAtIndex:indexPath.row];
        
        _webView = [[UIWebView alloc] init];
        NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
        
        NSString* documentDirectory = [documentDirectories objectAtIndex:0];
        NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",list.pdffilename]];

        NSURL *targetURL = [NSURL fileURLWithPath:documentDirectoryFilename];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [_webView loadRequest:request];
        
        [self.view addSubview:_webView];

        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            NSString *pdfstr = [self createPDFfromUIView:_webView saveToDocumentsWithFileName:[NSString stringWithFormat:@"%@",list.pdffilename]];
            
            wbView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0f, 70.0f, self.view.frame.size.width, self.view.frame.size.height-70)];
            NSURL *targetURL1 = [NSURL fileURLWithPath:pdfstr];
            NSURLRequest *request1 = [NSURLRequest requestWithURL:targetURL1];
            [wbView loadRequest:request1];
            
            [self.view addSubview:wbView];

            UIButton *cros = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-80, 20, 50, 50)];
            [cros setBackgroundImage:[UIImage imageNamed:@"cros"] forState:UIControlStateNormal];
            [cros addTarget:self action:@selector(cross) forControlEvents:UIControlEventTouchUpInside];
            [wbView addSubview:cros];
            
        });
        
        }
    
}
-(void)cross
{
    [wbView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// pdf create function...

-(NSString*)createPDFfromUIView:(UIView*)aView saveToDocumentsWithFileName:(NSString*)aFilename
{
    // Creates a mutable data object for updating with binary data, like a byte array
    // pdfData = [self createPDFDatafromUIView:aView];
    
    int height, width, header, sidespace;
    
    height = 842;
    width = 595;
    header = 15;
    sidespace = 30;
    
    // set header and footer spaces
    UIEdgeInsets pageMargins = UIEdgeInsetsMake(header, sidespace, header, sidespace);
    
    _webView.viewPrintFormatter.contentInsets = pageMargins;
    
    //Now create an object of UIPrintPageRenderer that is used to draw pages of content that are to be printed, with or without the assistance of print formatters.
    
    
    UYLGenericPrintPageRenderer *renderer = [[UYLGenericPrintPageRenderer alloc] init];
    NSString *str1 = [NSString stringWithFormat:@"\nSubmitted by Benjamin Przywolnllfet 03/08/2015 11:24 EST, ceptured et 29/07/2015 22:51 EST \n"
                      "Submission ID: C6sA2o3D-4sF5-43c7-M63-D87AAC32F396 \n"
                      "Mobile Apps For How You Do Business - powered by canvas (www,gocanvas.com)"
                      ];
    renderer.footerText = str1;
    
    NSString *str =[NSString stringWithFormat:@"\nCYANERGY PTY LTD\nUnit 30 (Ground Floor) \n"
                    "22-30 Wallace Avenue  \n"
                    "Point Cook VIC 3030 \n"
                    "PH: 1300 198 955 "
                    ];
    renderer.headerText = str;
    
    NSLog(@"-=-=-=- %@", str1);
    
    renderer.headerHeight = 70.0f;
    renderer.footerHeight = 70.0f;
    
    [renderer addPrintFormatter:_webView.viewPrintFormatter startingAtPageAtIndex:0];
    
    CGSize pageSize = CGSizeMake(width, height);
    CGRect printableRect = CGRectMake(pageMargins.left,
                                      pageMargins.top,
                                      pageSize.width - pageMargins.left - pageMargins.right,
                                      pageSize.height - pageMargins.top - pageMargins.bottom);
    
    CGRect paperRect = CGRectMake(0, 0, pageSize.width, pageSize.height);
    
    [renderer setValue:[NSValue valueWithCGRect:paperRect] forKey:@"paperRect"];
    [renderer setValue:[NSValue valueWithCGRect:printableRect] forKey:@"printableRect"];
    
    
    //Now get an NSData object from UIPrintPageRenderer object with specified paper size.
    NSData *pdfData1 = [self printToPDFWithRenderer: renderer paperRect:paperRect];
    //  NSData *pdfData1 = [renderer printToPDF];
    // save PDF file
    NSString *saveFileName = [NSString stringWithFormat:@"%@%dx%d.pdf", aFilename, (int)pageSize.width, (int)pageSize.height];
    NSLog(@"savefilename-=-=-= %@",saveFileName);
    
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* savePath = [documentDirectory stringByAppendingPathComponent:saveFileName];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:savePath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:savePath error:nil];
    }
    [pdfData1 writeToFile: savePath atomically: YES];

    return savePath;
}

- (NSData*) printToPDFWithRenderer:(UIPrintPageRenderer*)renderer paperRect:(CGRect)paperRect
{
    pdfData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData(pdfData, paperRect, nil );
    [renderer prepareForDrawingPages: NSMakeRange(0, renderer.numberOfPages)];
    CGRect bounds = UIGraphicsGetPDFContextBounds();

    for ( int i = 0 ; i < renderer.numberOfPages ; i++ )
    {
        UIGraphicsBeginPDFPage();
        
        [renderer drawPageAtIndex:i inRect: bounds];
        
    }
    UIGraphicsEndPDFContext();
    return pdfData;
    
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
