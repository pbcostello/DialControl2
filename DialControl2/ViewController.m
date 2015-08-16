//
//  ViewController.m
//  DialControl2
//
//  Created by pc on 8/7/15.
//  Copyright (c) 2015 Patrick Costello. All rights reserved.
//

#import "ViewController.h"
#import "DialUIView.h"

@interface ViewController ()<DialUIView_delegate>
@property (nonatomic) IBOutlet UILabel *label1;
@property (nonatomic) IBOutlet UILabel *label2;
@end

@implementation ViewController

-(void) dialUIViewMoved:(DialUIView*)dialUIView
{
    //show rotation in degrees
    NSString *rotation = [NSString stringWithFormat:@"%.2f",(dialUIView.rotation*(180/M_PI))];
    
    switch (dialUIView.tag)
    {
        case 0:
            _label1.text = rotation;
            break;
        case 1:
            _label2.text = rotation;
            break;
    }
}

@end
