//
//  KCHomeViewController.h
//  KCSports
//
//  Created by 坏蛋臭臭懒 on 16/3/3.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCBaseViewController.h"
#import "KCHomeFirstViewController.h"
#import "KCHomeSecondViewController.h"

@interface KCHomeViewController : KCBaseViewController <UIScrollViewDelegate>
{
    KCHomeFirstViewController   *_homeFirstVC;      // 主页第一个视图
    KCHomeSecondViewController  *_homeSecondVC;     // 主页第二个视图
}
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UISegmentedControl *segmentTitleView;
@end
