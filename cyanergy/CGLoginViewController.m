//
//  ViewController.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 17/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGLoginViewController.h"
#import "CGHomeViewController.h"

@interface CGLoginViewController ()

@end

@implementation CGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //NavigationController Hidden//
    
    self.navigationController.navigationBarHidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)log_in:(UIButton *)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CGLoginViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CGHomeViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults]setObject:@"John Curter" forKey:@"username"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
     if(textField.tag == 1)
    {
    [UIView animateWithDuration:0.3 animations:^{
              self.baseView.frame = CGRectMake(0.0f, -120.0f, self.baseView.frame.size.width, self.baseView.frame.size.height);
         } completion:^(BOOL finished) {
                
         }];
    }
    else if(textField.tag == 2)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.baseView.frame = CGRectMake(0.0f, -120.0f, self.baseView.frame.size.width, self.baseView.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
    
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if(textField.tag == 1)
    {
    [UIView animateWithDuration:0.3 animations:^{
        self.baseView.frame = CGRectMake(0.0f, 0.0f, self.baseView.frame.size.width, self.baseView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    }
    else if (textField.tag == 2)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.baseView.frame = CGRectMake(0.0f, 0.0f, self.baseView.frame.size.width, self.baseView.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
}

@end
