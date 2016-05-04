//
//  SlowlyAnimation.m
//  CustomTransitionsSample
//
//  Created by 鞠凝玮 on 16/1/28.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "SlowlyAnimation.h"

@implementation SlowlyAnimation
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect screenBounds = [[UIScreen mainScreen]bounds];

    UIView *containerView = [transitionContext containerView];
    if (!self.reverse){
        CGRect finalFrame = toVC.view.frame;
        
        toVC.view.frame = CGRectOffset(finalFrame, screenBounds.size.width, 0);
        [containerView addSubview:toVC.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toVC.view.frame = finalFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }else{
        CGRect finalFrame = CGRectOffset(fromVC.view.frame, screenBounds.size.width, 0);
        
        [containerView addSubview:toVC.view];
        [containerView sendSubviewToBack:toVC.view];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromVC.view.frame = finalFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}

@end
