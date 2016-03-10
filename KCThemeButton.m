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

- (id)initWithImage:(NSString *)imageName selectedImage:(NSString *)selectedImageName
{
    if (self = [self init])
    {
        // 在按钮创建时给属性赋值,以后在主题切换时用
        self.imageName = imageName;
        self.selectedImageName = selectedImageName;
        
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
    return self;
}

- (id)initWithBGImage:(NSString *)BGImageName BGSelectedImage:(NSString *)BGSelectedImageName
{
    if (self = [self init])
    {
        // 在按钮创建时给属性赋值,以后在主题切换时用
        self.BGImageName = BGImageName;
        self.BGSelectedImageName = BGSelectedImageName;
    }
    return self;
}

@end
