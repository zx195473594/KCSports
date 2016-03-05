//
//  KCBaseNavigationController.m
//  KCSports
//
//  Created by 坏蛋臭臭懒 on 16/3/3.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCBaseNavigationController.h"

@interface KCBaseNavigationController ()

@end

@implementation KCBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏背景图片
    [self setNavigationBackgroundImage];
}

#pragma mark - setNavigationBackgroundImage
- (void)setNavigationBackgroundImage
{
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
