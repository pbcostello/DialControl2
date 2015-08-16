//
//  DialUIView.h
//  DialControl2
//
//  Created by Patrick Costello.
//  Copyright (c) 2015 Patrick Costello. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DialUIView;

@protocol DialUIView_delegate <NSObject>
-(void) dialUIViewMoved:(DialUIView*)dialUIView;
@end

@interface DialUIView : UIView

@property (nonatomic) IBOutlet UIImageView *background;
@property (nonatomic,weak) IBOutlet id<DialUIView_delegate> dialUIView_delegate;
-(CGFloat) rotation;

@end


