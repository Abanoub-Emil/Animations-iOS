//
//  ViewController.h
//  BouncingBall
//
//  Created by Bero on 4/30/18.
//  Copyright © 2018 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollisionBehaviorDelegate , CAAnimationDelegate , CALayerDelegate,UIDynamicAnimatorDelegate>

@property UIDynamicAnimator * dynamicAnimator;
@property UIView *championBall;
- (void) gravity;
@end

