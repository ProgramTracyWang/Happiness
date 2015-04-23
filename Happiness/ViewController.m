//
//  ViewController.m
//  Happiness
//
//  Created by Tracy on 15/3/9.
//  Copyright (c) 2015年 Tracy. All rights reserved.
//

#import "ViewController.h"
#import "FaceView.h"

@interface ViewController ()
@property (nonatomic,weak) IBOutlet FaceView *faceView;
@end

@implementation ViewController
@synthesize happiness =_happiness;
@synthesize faceView = _faceView;

-(void) setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay];
}
-(void) setFaceView:(FaceView *)faceView
{
    _faceView = faceView;
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}


@end
