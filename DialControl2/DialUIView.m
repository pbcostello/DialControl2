//
//  DialUIView.m
//  DialControl2
//
//  Created by Patrick Costello.
//  Copyright (c) 2015 Patrick Costello. All rights reserved.
//

#import "DialUIView.h"
#define M_PIx2 (M_PI*2)

@implementation DialUIView

-(double) getRadian:(CGPoint) v
{
    double l = sqrt((v.x*v.x)+(v.y*v.y));
    if (l == 0)
        return 0;

    double radian = fmodf(atan2(v.x/l,v.y/l),M_PIx2);
    if (radian < 0)
        radian += M_PIx2;
    if (radian == -0)
        radian = 0;
    return radian;
}

-(double) getMoveAngle: (CGPoint )v1 :(CGPoint) v2
{
    CGFloat midPtX = self.frame.size.width/2;
    CGFloat midPtY = self.frame.size.height/2;
    
    double radian1 = fmod ([self getRadian:CGPointMake(v1.x-midPtX,v1.y-midPtY)], M_PIx2);
    double radian2 = fmod ([self getRadian:CGPointMake(v2.x-midPtX,v2.y-midPtY)], M_PIx2);
    if (radian1 < radian2)
        radian1 += M_PIx2;
    
    double diff = radian1-radian2;
    return diff<=M_PI ? diff : -((radian2-radian1) + M_PIx2);
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch1 = [[touches allObjects] objectAtIndex:0];
    self.rot -= [self getMoveAngle:[touch1 locationInView:self] :[touch1 previousLocationInView:self]];
    self.background.transform = CGAffineTransformMakeRotation(self.rot);
    [self.dialUIView_delegate dialUIViewMoved:self];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil)
    {
        self.rot = 0;
    }
    return self;
};


@end
