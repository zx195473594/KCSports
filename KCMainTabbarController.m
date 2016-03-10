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
    UIImageView     *_imageViewTabbarBG;    // tabbar背景视图
    NSMutableArray  *_arrayButtons;
    NSMutableArray  *_arrayLabels;
}
@end

@implementation KCMainTabbarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置自带tabbar隐藏
    self.tabBar.hidden = YES;

    // 加载控制器视图
    [self _loadViewControllers];

    // 加载按钮
    [self _initViews];
    
    // 默认控制器索引为0
    self.selectedIndex = 0;
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
    // 存储控制器
    NSArray *arrayVCs = @[homeVC,secondVC,thirdVC,FthVC,FiveVC];
    
    NSMutableArray *arrayViewControllers = [NSMutableArray array];
    for (UIViewController *controller in arrayVCs)
    {
        KCBaseNavigationController *navigationController = [[KCBaseNavigationController alloc]initWithRootViewController:controller];
        [arrayViewControllers addObject:navigationController];
    }
    // 装载控制器
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
    
    NSArray *arrayLabelTitle = @[@"圈子",@"发现",@"运动",@"消息",@"我的"];
    float x = (ScreenWidth - 5 * 30) / 6;
    
    _arrayButtons = [NSMutableArray array];
    _arrayLabels = [NSMutableArray array];
    for (int i = 0 ; i < 5; i ++)
    {
        // 增加5个按钮用于切换控制器
        UIButton *buttonIndex = [KCUIFactory createButtonWithImageName:arrayImageNameNormal[i] selectedImageName:arrayImageNameSelected[i]];
        buttonIndex.tag = i;
        buttonIndex.frame = CGRectMake( (30 + x) * i + x , _imageViewTabbarBG.height - 30 - 10 - 8 , 30, 30);
        [buttonIndex addTarget:self action:@selector(selectedIndexChange:) forControlEvents:UIControlEventTouchUpInside];
        [_imageViewTabbarBG addSubview:buttonIndex];
        [_arrayButtons addObject:buttonIndex];
        
        
        // 增加5个label
        UILabel *labelIndex = [KCUIFactory createLabelWithColorName:nil];
        labelIndex.tag = 10 + i;
        labelIndex.frame = CGRectMake((30 + x) * i + x + 3, _imageViewTabbarBG.height - 18 , 30, 10);
        labelIndex.text = arrayLabelTitle[i];
        labelIndex.textColor = [UIColor whiteColor];
        labelIndex.font = [UIFont systemFontOfSize:12.0f];
        [labelIndex sizeToFit];
        [_imageViewTabbarBG addSubview:labelIndex];
        [_arrayLabels addObject:labelIndex];
    }
    // 将默认索引对应的label字体颜色设置为红色
    ((UIButton *)[_arrayButtons objectAtIndex:0]).selected = YES;
    ((UILabel *)[_arrayLabels objectAtIndex:0]).textColor = Color(29, 132, 69, 1);
}

- (void)_changeTextColorWithViewTag:(NSInteger)tag andColor:(UIColor *)color
{
    // 1.获取tag对应的label
    UILabel *label = (UILabel *)[self.view viewWithTag:tag];
    // 2.设置字体颜色
    label.textColor = color;
}

#pragma mark - 切换控制器
- (void)selectedIndexChange:(UIButton *)button
{
    ((UIButton *)[_arrayButtons objectAtIndex:self.selectedIndex]).selected = NO;
    // 1.将索引对应的label字体设置为白色
    [self _changeTextColorWithViewTag:self.selectedIndex + 10 andColor:[UIColor whiteColor]];
    // 2.切换控制器索引
    self.selectedIndex = button.tag;
    // 3.将更改后的索引对应的label字体颜色设置为红色
    [self _changeTextColorWithViewTag:self.selectedIndex + 10 andColor:Color(29, 132, 69, 1)];
    button.selected = YES;
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
