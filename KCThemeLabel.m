//
//  KCThemeLabel.m
//  KCSports
//
//  Created by KC on 16/3/8.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCThemeLabel.h"

@implementation KCThemeLabel

- (id)init
{
    if (self = [super init])
    {
        // 切换主题时使用
    }
    return self;
}

- (id)initWithColorName:(NSString *)colorName
{
    if (self = [self init])
    {
        self.colorName = colorName;
    }
    return self;
}

@end
