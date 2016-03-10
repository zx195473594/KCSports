//
//  KCUIFactory.m
//  KCSports
//
//  Created by KC on 16/3/7.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCUIFactory.h"

@implementation KCUIFactory

#pragma mark - 创建主题button
+ (KCThemeButton *)createButtonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    KCThemeButton *button = [[KCThemeButton alloc]initWithImage:imageName selectedImage:selectedImageName];
    return button;
}

+ (KCThemeButton *)createButtonWithBGImageName:(NSString *)BGImageName BGSelectedImageName:(NSString *)BGSelectedImageName
{
    KCThemeButton *button = [[KCThemeButton alloc]initWithBGImage:BGImageName BGSelectedImage:BGSelectedImageName];
    return button;
}

#pragma mark - 创建主题label
+ (KCThemeLabel *)createLabelWithColorName:(NSString *)colorName
{
    KCThemeLabel *label = [[KCThemeLabel alloc]initWithColorName:colorName];
    return label;
}
@end
