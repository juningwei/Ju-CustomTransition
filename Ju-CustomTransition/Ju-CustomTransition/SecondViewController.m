//
//  SecondViewController.m
//  Ju-CustomTransition
//
//  Created by 鞠凝玮 on 16/2/2.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Second";
    [self setBackButton];

}

- (void)push{
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}



@end
