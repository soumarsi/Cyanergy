//
//  schedule15View.m
//  cyanergy
//
//  Created by koustov basu on 18/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "schedule15View.h"

@implementation schedule15View


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    _numField1.delegate=self;
    _numField2.delegate=self;
    _numField3.delegate=self;
    _numField4.delegate=self;
    _numField5.delegate=self;
    _numField6.delegate=self;
    
    _commentBox2.delegate=self;
    _commentBox3.delegate=self;
    _commentBox4.delegate=self;
    _commentBox5.delegate=self;
    _commentBox6.delegate=self;
    

    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myKeyboardWillHideHandler:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"textField delegate calling...");
    
    [UIView transitionWithView:_scrollView
                      duration:0.75
                       options:UIViewAnimationOptionTransitionNone
                    animations:^{
                        
                        scrollPoint=_scrollView.contentOffset;
                        
                        [_scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-textField.frame.size.height*2)];
                    }
                    completion:nil];
    
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"textView delegate calling...");
    
    
    [UIView transitionWithView:_scrollView
                      duration:0.75
                       options:UIViewAnimationOptionTransitionNone
                    animations:^{
                        
                        scrollPoint=_scrollView.contentOffset;
                        
                        [_scrollView setContentOffset:CGPointMake(0, textView.frame.origin.y-textView.frame.size.height+62)];
                    }
                    completion:nil];
    
    
}



- (void) myKeyboardWillHideHandler:(NSNotification *)notification
{
    NSLog(@"Notification center calling...");
    
    [_numField1 resignFirstResponder];
    [_numField2 resignFirstResponder];
    [_numField3 resignFirstResponder];
    [_numField4 resignFirstResponder];
    [_numField5 resignFirstResponder];
    [_numField6 resignFirstResponder];
   
    [_commentBox2 resignFirstResponder];
    [_commentBox3 resignFirstResponder];
    [_commentBox4 resignFirstResponder];
    [_commentBox5 resignFirstResponder];
    [_commentBox6 resignFirstResponder];
   
    
    [UIView transitionWithView:_scrollView
                      duration:0.75
                       options:UIViewAnimationOptionTransitionNone
                    animations:^{
                        
                      
                        
                        [_scrollView setContentOffset:scrollPoint];
                    }
                    completion:nil];

    
    
    
}


@end
