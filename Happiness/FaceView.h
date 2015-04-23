//
//  FaceView.h
//  Happiness
//
//  Created by Tracy on 15/3/9.
//  Copyright (c) 2015年 Tracy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

-(void)pinch:(UIPinchGestureRecognizer *) gesture;

@end
