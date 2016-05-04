//
//  BaseViewController.m
//  Ju-CustomTransition
//
//  Created by 鞠凝玮 on 16/2/2.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setFrame:CGRectMake(0, 0, 60, 30)];
    [self.button setTitle:@"Push" forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor grayColor]];
    self.button.center = self.view.center;
    [self.button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
}

- (void)setBackButton{
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Pop" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
