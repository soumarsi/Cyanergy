//
//  ViewController.m
//  cyanergy
//
//  Created by Soumarsi Kundu on 17/08/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "CGLoginViewController.h"
#import "CGHomeViewController.h"
#import "schedule21CView.h"


@interface CGLoginViewController ()

@end

@implementation CGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    self.globalClass = [[CGglobalfunction alloc]init];
    
    _userName.text = @"Biplab@esolzmail.com";
    _password.text = @"123456";
    
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
    
    
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
    
    if (self.userName.tag == 1)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
    else if (self.password.tag == 2)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
    
    if (self.globalClass.connectedToNetwork == YES)
    {
        if ([self.userName.text isEqualToString:@""])
        {
            self.userName.text = @"";
            self.userName.placeholder = [NSString check_username];
            [self.userName setValue:[UIColor redColor]forKeyPath:@"_placeholderLabel.textColor"];
            [self.userName setValue:[UIFont usernameFont] forKeyPath:@"_placeholderLabel.font"];
        }
        else if ([self.password.text isEqualToString:@""])
        {
            self.password.text = @"";
            self.password.placeholder = [NSString check_password];
            [self.password setValue:[UIColor redColor]forKeyPath:@"_placeholderLabel.textColor"];
            [self.password setValue:[UIFont usernameFont] forKeyPath:@"_placeholderLabel.font"];
        }
        else if ([self.userName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ].length <1)
        {
            self.userName.text = @"";
            self.userName.placeholder = [NSString check_username];
            [self.userName setValue:[UIColor redColor]forKeyPath:@"_placeholderLabel.textColor"];
            [self.userName setValue:[UIFont usernameFont] forKeyPath:@"_placeholderLabel.font"];
        }
        else
        {
            
            [self.globalClass parameterstring:[NSString stringWithFormat:@"action.php?mode=login&email=%@&password=%@",[self.userName.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],self.password.text]withblock:^(id result, NSError *error) {
                
                if (result)
                {
                    DebugLog(@"result-- %@",result);
                    
                    if ([[result objectForKey:@"message"] isEqualToString:[NSString success]])
                    {
                        NSArray *ar = [result objectForKey:@"packagetypedata"];
                        
                        [self.globalClass Userdict:[ar objectAtIndex:0]];
                        
                        
                        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        CGLoginViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CGHomeViewController"];
                        [self.navigationController pushViewController:vc animated:YES];
                        
                    }
                    else if ([[result objectForKey:@"message"] isEqualToString:[NSString Login_Failed]])
                    {
                        self.Alert = [[UIAlertView alloc]initWithTitle:[NSString check_internet_title] message:[NSString Login_Failed] delegate:self cancelButtonTitle:[NSString Ok] otherButtonTitles: nil];
                        [self.Alert show];
                        
                        self.userName.text = @"";
                        self.password.text = @"";
                    }
                }
                else if (error)
                {
                    NSLog(@"error  %@", error);
                }
                
            }];
    
            
            

        }
    }
    else
    {
        self.Alert = [[UIAlertView alloc]initWithTitle:[NSString check_internet_title] message:[NSString check_internet] delegate:self cancelButtonTitle:[NSString Ok] otherButtonTitles:nil];
        [self.Alert show];
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(self.userName.tag == 1)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
    else if (self.password.tag == 2)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }

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
    
    if(self.userName.tag == 1)
    {
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    }
    else if (self.password.tag == 2)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
}

@end
