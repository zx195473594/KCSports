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

- (void)viewDidLoad {
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
    UIButton *buttonLeftItem = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonLeftItem.frame = CGRectMake(0, 0, 30, 30);
    [buttonLeftItem setTitle:@"左1" forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonLeftItem];
    
    UIButton *buttonRightItem1 = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonRightItem1.frame = CGRectMake(0, 0, 30, 30);
    [buttonRightItem1 setTitle:@"右1" forState:UIControlStateNormal];
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc]initWithCustomView:buttonRightItem1];

    UIButton *buttonRightItem2 = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonRightItem2.frame = CGRectMake(0, 0, 30, 30);
    [buttonRightItem2 setTitle:@"右2" forState:UIControlStateNormal];
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc]initWithCustomView:buttonRightItem2];
    
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

- (void)loadTwoViewControllers
{
    _homeFirstVC    = [[KCHomeFirstViewController alloc]init];
    _homeFirstVC.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    _homeSecondVC   = [[KCHomeSecondViewController alloc]init];
    _homeSecondVC.view.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight);
    [self.scrollView addSubview:_homeFirstVC.view];
    [self.scrollView addSubview:_homeSecondVC.view];
}

#pragma mark - UIScrollViewDelegate
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
- (void)didReceiveMemoryWarning {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
