//
//  KCThemeImageView.m
//  KCSports
//
//  Created by KC on 16/3/9.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCThemeImageView.h"

@implementation KCThemeImageView

- (id)init
{
    if (self = [super init])
    {
        // 切换主题时用
    }
    return self;
}

- (id)initWithImageName:(NSString *)imageName
{
    if (self = [self init])
    {
        self.imageName = imageName;
    }
    return self;
}

@end
