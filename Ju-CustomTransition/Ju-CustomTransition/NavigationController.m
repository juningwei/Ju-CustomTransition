//
//  NavigationController.m
//  Ju-CustomTransition
//
//  Created by 鞠凝玮 on 16/2/2.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "NavigationController.h"
#import "SlowlyAnimation.h"
#import "SwipeInteraction.h"

@interface NavigationController()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong)SlowlyAnimation *slowlyAni;
@property (nonatomic, strong)SwipeInteraction *swipeInter;
@end

@implementation NavigationController

-(SlowlyAnimation *)slowlyAni{
    if (!_slowlyAni){
        _slowlyAni = [SlowlyAnimation new];
    }
    return _slowlyAni;
}

-(SwipeInteraction *)swipeInter{
    if (!_swipeInter){
        _swipeInter = [SwipeInteraction new];
    }
    return _swipeInter;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.delegate = self;
//    __weak typeof (self) weakSelf = self;
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.interactivePopGestureRecognizer.delegate = weakSelf;
//    }
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
    if (operation == UINavigationControllerOperationPush){
        [self.swipeInter writeToViewController:toVC];

        self.slowlyAni.reverse = NO;
        return self.slowlyAni;
    }else if (operation == UINavigationControllerOperationPop){
        self.slowlyAni.reverse = YES;
        return self.slowlyAni;
    }
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0){
    return self.swipeInter.interactionInProgress ? self.swipeInter : nil;
}

@end
