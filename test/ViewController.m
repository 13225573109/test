//
//  ViewController.m
//  test
//
//  Created by yan on 16/5/18.
//  Copyright © 2016年 xujie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(100, 100, 100, 100);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn setTitle:@"测试" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    NSLog(@"test");
}

-(void)btnClick
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"测试" message:@"测试" delegate:nil cancelButtonTitle:@"test" otherButtonTitles:nil, nil];
    [alert show];
}

@end
