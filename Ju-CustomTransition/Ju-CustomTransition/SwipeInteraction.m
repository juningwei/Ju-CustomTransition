//
//  SwipeInteraction.m
//  Ju-CustomTransition
//
//  Created by 鞠凝玮 on 16/2/2.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "SwipeInteraction.h"
#define ScreenWidth [[UIScreen mainScreen]bounds].size.width

@interface SwipeInteraction ()
@property (nonatomic, assign)BOOL shouldCompleteTransition;
@property (nonatomic, strong)UINavigationController *navigationController;

@end

@implementation SwipeInteraction
- (void)writeToViewController:(UIViewController *)viewController{
    self.navigationController = viewController.navigationController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView *)view{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

- (CGFloat)completionSpeed{
    return 1-self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer{
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
//            if (translation.x < 20){
                self.interactionInProgress = YES;
                [self.navigationController popViewControllerAnimated:YES];
//            }
        }
            
            break;
        case UIGestureRecognizerStateChanged:{
            NSLog(@"%f",translation.x);
            CGFloat fraction = (translation.x/(ScreenWidth-20));
//            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.shouldCompleteTransition = (fraction > 0.5);
            [self updateInteractiveTransition:fraction];
        }
            
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            self.interactionInProgress = NO;
            if (!_shouldCompleteTransition || gestureRecognizer.state == UIGestureRecognizerStateCancelled){
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
        }
            
            break;
            
        default:
            break;
    }
    
}

@end
