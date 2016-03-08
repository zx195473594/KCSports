//
//  KCThemeButton.m
//  KCSports
//
//  Created by KC on 16/3/7.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCThemeButton.h"

@implementation KCThemeButton

- (id)init
{
    if (self = [super init])
    {
        // 切换主题时使用
    }
    return self;
}

- (id)initWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName
{
    if (self = [self init])
    {
        // 在按钮创建时给属性赋值,以后在主题切换时用
        self.imageName = imageName;
        self.highLightedImageName = highlightedImageName;
        
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }
    return self;
}

- (id)initWithBGImage:(NSString *)BGImageName BGHighlightedImage:(NSString *)BGHighlightedImageName
{
    if (self = [self init])
    {
        // 在按钮创建时给属性赋值,以后在主题切换时用
        self.BGImageName = BGImageName;
        self.BGHighlightedImageName = BGHighlightedImageName;
    }
    return self;
}

@end
