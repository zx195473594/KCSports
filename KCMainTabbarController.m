//
//  KCMainTabbarController.m
//  KCSports
//
//  Created by 坏蛋臭臭懒 on 16/3/3.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCMainTabbarController.h"

@interface KCMainTabbarController ()
{
    UIImageView *_imageViewTabbarBG;    // tabbar背景视图
}
@end

@implementation KCMainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 设置自带tabbar隐藏
    self.tabBar.hidden = YES;
    
    // 加载控制器视图
    [self _loadViewControllers];
    
    // 加载按钮
    [self _initViews];
}

#pragma mark - Actions
// 加载控制器
- (void)_loadViewControllers
{
    KCHomeViewController    *homeVC     = [[KCHomeViewController alloc]init];
    KCSecondViewController  *secondVC   = [[KCSecondViewController alloc]init];
    KCThirdViewController   *thirdVC    = [[KCThirdViewController alloc]init];
    KC4thViewController     *FthVC      = [[KC4thViewController alloc]init];
    KC5thViewController     *FiveVC     = [[KC5thViewController alloc]init];
    NSArray *arrayVCs = @[homeVC,secondVC,thirdVC,FthVC,FiveVC];
    NSMutableArray *arrayViewControllers = [NSMutableArray array];
    
    for (UIViewController *controller in arrayVCs) {
        KCBaseNavigationController *navigationController = [[KCBaseNavigationController alloc]initWithRootViewController:controller];
        [arrayViewControllers addObject:navigationController];
    }
    
    self.viewControllers = arrayViewControllers;
}

// 添加背景和按钮
- (void)_initViews
{
    // tabbar背景视图
    _imageViewTabbarBG = [[UIImageView alloc]initWithFrame:CGRectMake(0,ScreenHeight - 49,ScreenWidth , 49)];
    _imageViewTabbarBG.backgroundColor = [UIColor redColor];
    _imageViewTabbarBG.image = [UIImage imageNamed:@"tabbar_background"];
    _imageViewTabbarBG.userInteractionEnabled = YES;
    [self.view addSubview:_imageViewTabbarBG];
    
    // 默认状态图
    NSArray *arrayImageNameNormal    = @[@"tabbar_home",@"tabbar_profile",@"tabbar_message_center",@"tabbar_discover",@"tabbar_more"];
    // 选定状态图
    NSArray *arrayImageNameSelected  = @[@"tabbar_home_selected",@"tabbar_profile_selected",@"tabbar_message_center_selected",@"tabbar_discover_selected",@"tabbar_more_selected"];
    float x = (ScreenWidth - 5 * 30) / 6;
    for (int i = 0 ; i < 5; i ++) {
        UIButton *buttonIndex = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonIndex.tag = i;
        buttonIndex.frame = CGRectMake( (30 + x) * i + x , (_imageViewTabbarBG.height - 30) / 2 , 30, 30);;
        [buttonIndex setImage:[UIImage imageNamed:arrayImageNameNormal[i]] forState:UIControlStateNormal];
        [buttonIndex setImage:[UIImage imageNamed:arrayImageNameSelected[i]] forState:UIControlStateSelected];
        [buttonIndex addTarget:self action:@selector(selectedIndexChange:) forControlEvents:UIControlEventTouchUpInside];
        [_imageViewTabbarBG addSubview:buttonIndex];
    }
}

#pragma mark - 切换控制器
- (void)selectedIndexChange:(UIButton *)button
{
    self.selectedIndex = button.tag;  // 切换控制器索引
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
