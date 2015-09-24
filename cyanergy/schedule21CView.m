//
//  schedule21CView.m
//  cyanergy
//
//  Created by koustov basu on 21/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "schedule21CView.h"

@implementation schedule21CView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
   //  _scrollView.contentSize=CGSizeMake(903, 1230);
    
    _numField14.delegate=self;
    _numField15.delegate=self;
    _numField16.delegate=self;
    _numField17.delegate=self;
    _numField18.delegate=self;
    
    
    _commentBox17.delegate=self;
    _commentBox18.delegate=self;
    _commentBox19.delegate=self;
    _commentBox20.delegate=self;
    _commentBox21.delegate=self;
    
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
    
    [_numField14 resignFirstResponder];
    [_numField15 resignFirstResponder];
    [_numField16 resignFirstResponder];
    [_numField17 resignFirstResponder];
    [_numField18 resignFirstResponder];
    
    [_commentBox17 resignFirstResponder];
    [_commentBox18 resignFirstResponder];
    [_commentBox19 resignFirstResponder];
    [_commentBox20 resignFirstResponder];
    [_commentBox21 resignFirstResponder];
    
    
    [UIView transitionWithView:_scrollView
                      duration:0.75
                       options:UIViewAnimationOptionTransitionNone
                    animations:^{
                        
                        
                        
                        [_scrollView setContentOffset:scrollPoint];
                    }
                    completion:nil];
    
    
    
    
}



@end
