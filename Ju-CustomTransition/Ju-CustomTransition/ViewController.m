//
//  ViewController.m
//  Ju-CustomTransition
//
//  Created by 鞠凝玮 on 16/2/2.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.title = @"First";
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)push{
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
