//
//  schedule21BView.m
//  cyanergy
//
//  Created by koustov basu on 21/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "schedule21BView.h"

@implementation schedule21BView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    _numField9.delegate=self;
    _numField10.delegate=self;
    _numField11.delegate=self;
    _numField12.delegate=self;
    _numField13.delegate=self;
    
    
    _commentBox12.delegate=self;
    _commentBox13.delegate=self;
    _commentBox14.delegate=self;
    _commentBox15.delegate=self;
    _commentBox16.delegate=self;
    
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
    
    [_numField9 resignFirstResponder];
    [_numField10 resignFirstResponder];
    [_numField11 resignFirstResponder];
    [_numField12 resignFirstResponder];
    [_numField13 resignFirstResponder];
    
    [_commentBox12 resignFirstResponder];
    [_commentBox13 resignFirstResponder];
    [_commentBox14 resignFirstResponder];
    [_commentBox15 resignFirstResponder];
    [_commentBox16 resignFirstResponder];
    
    
    [UIView transitionWithView:_scrollView
                      duration:0.75
                       options:UIViewAnimationOptionTransitionNone
                    animations:^{
                        
                        
                        
                        [_scrollView setContentOffset:scrollPoint];
                    }
                    completion:nil];
    
    
    
    
}


@end
