//
//  ViewController.m
//  BouncingBall
//
//  Created by Bero on 4/30/18.
//  Copyright © 2018 ITI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.championBall = [[UIView alloc] initWithFrame:CGRectMake(141.0, 170.0, 100.0, 100.0)];
    self.championBall.backgroundColor = [   UIColor magentaColor];
    self.championBall.layer.cornerRadius=50.0;
    self.championBall.layer.borderColor = [UIColor blackColor].CGColor;
    self.championBall.layer.borderWidth=3;
    self.championBall.restorationIdentifier = @"I have No Boundries ^_^ ";
    self.championBall.accessibilityIdentifier = @"I have No Boundries ^_^ ";
    
    [self.view addSubview:self.championBall];
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.dynamicAnimator.delegate = self;
    [self gravity];
}

- (void) gravity {
//    printf("collision happen \n");
    UIGravityBehavior * grav = [[UIGravityBehavior alloc] initWithItems:@[self.championBall]];
    [self.dynamicAnimator addBehavior:grav];
    
    UICollisionBehavior * collide = [[UICollisionBehavior alloc] initWithItems:@[self.championBall]];
    [collide setTranslatesReferenceBoundsIntoBoundary:YES];
    
    collide.collisionDelegate=self;
    collide.collisionMode = UICollisionBehaviorModeEverything;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width/2;
    CGFloat screenHeight = screenRect.size.height;
    printf("%f  %f\n",screenWidth,screenHeight);
    CGPoint point;
    point.x = 0;
    point.y = screenHeight;
    printf("%f \n",point.x);
    printf("%f \n",point.y);
    CGPoint point1;
    point1.x = _championBall.frame.origin.x+_championBall.frame.size.width;
    point1.y = _championBall.frame.origin.y+_championBall.frame.size.height;
    CGPoint point2;
    point2.x = screenWidth;
    point2.y = screenHeight;
    printf("%f \n",point2.x);
    printf("%f \n",point2.y);
    [collide addBoundaryWithIdentifier:@"I have No Boundries ^_^ " fromPoint:point toPoint:point2];
    UIDynamicItemBehavior * bounce = [[UIDynamicItemBehavior alloc] initWithItems:@[self.championBall]];
    bounce.elasticity=0.75;
//    bounce.resistance=10;
    [self.dynamicAnimator addBehavior:bounce];
    [self.dynamicAnimator addBehavior:collide];
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
     self.championBall.backgroundColor = [   UIColor cyanColor];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    printf("ay 7aga ");
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier{
    printf("collision happen \n");
    
//    self.championBall.backgroundColor = [   UIColor magentaColor];
}


- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2{
//     printf("collision happen \n");
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p{
//    printf("collision happen 1 \n");
}
- (void)collapseSecondaryViewController:(UIViewController *)secondaryViewController forSplitViewController:(UISplitViewController *)splitViewController{
//    printf("collision happen 2\n");
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    printf("collision happen 3 \n");
//    self.championBall.backgroundColor = [   UIColor cyanColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
