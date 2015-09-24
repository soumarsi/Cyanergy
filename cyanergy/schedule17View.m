//
//  schedule17View.m
//  cyanergy
//
//  Created by koustov basu on 18/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "schedule17View.h"

@implementation schedule17View

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    _numField7.delegate=self;
    _numField8.delegate=self;
  
    
    _commentBox7.delegate=self;
    _commentBox8.delegate=self;
    _commentBox9.delegate=self;
    _commentBox10.delegate=self;
    _commentBox11.delegate=self;
    
    
    
    
    
    
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
    
    [_numField7 resignFirstResponder];
    [_numField8 resignFirstResponder];
    
    [_commentBox7 resignFirstResponder];
    [_commentBox8 resignFirstResponder];
    [_commentBox9 resignFirstResponder];
    [_commentBox10 resignFirstResponder];
    [_commentBox11 resignFirstResponder];
    
    
    [UIView transitionWithView:_scrollView
                      duration:0.75
                       options:UIViewAnimationOptionTransitionNone
                    animations:^{
                        
                         
                        [_scrollView setContentOffset:scrollPoint];
                    }
                    completion:nil];
    
    
    
    
}



@end
