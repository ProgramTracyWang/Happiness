//
//  FaceView.m
//  Happiness
//
//  Created by Tracy on 15/3/9.
//  Copyright (c) 2015年 Tracy. All rights reserved.
//

#import "FaceView.h"

@implementation FaceView

@synthesize scale = _scale;

#define DEFAULT_SCALE 0.90

-(CGFloat)scale
{
    if(!_scale){
        return DEFAULT_SCALE;
    } else {
        return _scale;
    }
}
-(void)setScale:(CGFloat)scale
{
    if (scale != _scale) {
        _scale = scale;
        [self setNeedsDisplay];
    }
}
-(void)pinch:(UIPinchGestureRecognizer *) gesture
{
    if (gesture.state == UIGestureRecognizerStateChanged||
        gesture.state == UIGestureRecognizerStateEnded) {
        self.scale = gesture.scale;
        gesture.scale = 1;
    }
}

-(void)setup
{
    self.contentMode = UIViewContentModeRedraw;
}
-(void)awakeFromNib
{
    [self setup];
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


-(void)drawCircleAtPoint:(CGPoint) p withRadius:(CGFloat)radius inContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    UIGraphicsPopContext();
    
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint midpoint;
    midpoint.x = self.bounds.origin.x + self.bounds.size.width/2;
    midpoint.y = self.bounds.origin.x + self.bounds.size.height/2;
    
    CGFloat size = self.bounds.size.width/2;
    if (self.bounds.size.width>self.bounds.size.height) {
        size = self.bounds.size.height/2;
    }
    size *= self.scale;
    
    CGContextSetLineWidth(context, 5.0);
    [[UIColor blueColor] setStroke];
    
    [self drawCircleAtPoint:midpoint withRadius:size inContext:context];
    
#define EYE_H 0.35
#define EYE_V 0.35
#define EYE_RADIUS 0.10
    CGPoint eyePoint;
    eyePoint.x = midpoint.x - size*EYE_H;
    eyePoint.y = midpoint.y - size*EYE_V;
    
    [self drawCircleAtPoint:eyePoint withRadius:size * EYE_RADIUS inContext:context];
    eyePoint.x += size * EYE_H * 2;
    [self drawCircleAtPoint:eyePoint withRadius:size * EYE_RADIUS inContext:context];
}


@end
