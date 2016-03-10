//
//  KCHomeViewController.m
//  KCSports
//
//  Created by 坏蛋臭臭懒 on 16/3/3.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCHomeViewController.h"

@interface KCHomeViewController ()

@end

@implementation KCHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"1";
    
    [self loadTitleView];
    
    [self loadScrollView];
    
    [self loadTwoViewControllers];
}

#pragma mark - Actions
- (void)loadTitleView
{
    // 加载顶部segment
    self.segmentTitleView = [[UISegmentedControl alloc]initWithItems:@[@"第一",@"第二"]];
    self.segmentTitleView.frame = CGRectMake(0, 0, 1, 24);
    self.segmentTitleView.selectedSegmentIndex = 0;
    self.segmentTitleView.tintColor = [UIColor colorWithRed:251/255 green:159/255 blue:185/255 alpha:1];
    [self.segmentTitleView addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.segmentTitleView;
    
    // 加载左右按钮
    UIButton *buttonLeftItem = [KCUIFactory createButtonWithImageName:nil selectedImageName:nil];
    buttonLeftItem.tag = 1;
    buttonLeftItem.frame = CGRectMake(0, 0, 30, 30);
    [buttonLeftItem setTitle:@"左1" forState:UIControlStateNormal];
    [buttonLeftItem addTarget:self action:@selector(barButtonItemActions:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonLeftItem];
    
    UIButton *buttonRightItem1 = [KCUIFactory createButtonWithImageName:nil selectedImageName:nil];
    buttonRightItem1.tag = 2;
    buttonRightItem1.frame = CGRectMake(0, 0, 30, 30);
    [buttonRightItem1 setTitle:@"右1" forState:UIControlStateNormal];
    [buttonRightItem1 addTarget:self action:@selector(barButtonItemActions:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc]initWithCustomView:buttonRightItem1];

    UIButton *buttonRightItem2 = [KCUIFactory createButtonWithImageName:nil selectedImageName:nil];
    buttonRightItem2.tag = 3;
    buttonRightItem2.frame = CGRectMake(0, 0, 30, 30);
    [buttonRightItem2 setTitle:@"右2" forState:UIControlStateNormal];
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc]initWithCustomView:buttonRightItem2];
    [buttonRightItem2 addTarget:self action:@selector(barButtonItemActions:) forControlEvents:UIControlEventTouchUpInside];
 
    self.navigationItem.rightBarButtonItems = @[rightItem2,rightItem1];

}

- (void)loadScrollView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(2 * ScreenWidth, 0);
    self.scrollView.pagingEnabled = YES; // 分页
    self.scrollView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.scrollView];
    
}



#pragma mark - UIScrollViewDelegate
// 滚动视图代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.scrollView.contentOffset.x >= ScreenWidth / 2)
    {
        self.segmentTitleView.selectedSegmentIndex = 1;
    }
    else
    {
        self.segmentTitleView.selectedSegmentIndex = 0;
    }
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Actions
// 点击segmentController响应方法
- (void)changeViewController:(UISegmentedControl *)segmentControl
{
    // 根据segmentControl索引设置scrollView的contentOffset
    [self.scrollView setContentOffset:CGPointMake(ScreenWidth * segmentControl.selectedSegmentIndex, 0) animated:YES];
}


// 点击导航栏item事件
- (void)barButtonItemActions:(UIButton *)button
{
    switch (button.tag)
    {
        case 1:
        {
            NSLog(@"左1");
        }
            break;
        case 2:
        {
            NSLog(@"右1");
        }
            break;
        case 3:
        {
            NSLog(@"右2");
        }
            break;
            
        default:
            break;
    }
}

// 设置滚动视图控制器
- (void)loadTwoViewControllers
{
    _homeFirstVC    = [[KCHomeFirstViewController alloc]init];
    _homeFirstVC.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    _homeSecondVC   = [[KCHomeSecondViewController alloc]init];
    _homeSecondVC.view.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight);
    [self.scrollView addSubview:_homeFirstVC.view];
    [self.scrollView addSubview:_homeSecondVC.view];
}

@end
