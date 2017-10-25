//
//  ViewController.m
//  MyFrameWorks
//
//  Created by Lycodes-MacBookPro15 on 2017/10/24.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 8.0f)];
    textLabel.text = @"191";
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
