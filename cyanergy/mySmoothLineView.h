//
//  mySmoothLineView.h
//  EzyLog
//
//  Created by ios on 26/06/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mySmoothLineView : UIView
{
    UIBezierPath *_path;
    UIImage *incrementalImage;
    CGPoint pts[5];
    uint ctr;
}

@end
