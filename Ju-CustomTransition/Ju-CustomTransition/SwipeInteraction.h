//
//  SwipeInteraction.h
//  Ju-CustomTransition
//
//  Created by 鞠凝玮 on 16/2/2.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeInteraction : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign)BOOL interactionInProgress;
- (void)writeToViewController:(UIViewController *)viewController;

@end
