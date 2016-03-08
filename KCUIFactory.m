//
//  KCUIFactory.m
//  KCSports
//
//  Created by KC on 16/3/7.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCUIFactory.h"

@implementation KCUIFactory

+ (KCThemeButton *)createButtonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highLightedImageName
{
    KCThemeButton *button = [[KCThemeButton alloc]initWithImage:imageName highlightedImage:highLightedImageName];
    return button;
}

+ (KCThemeButton *)createButtonWithBGImageName:(NSString *)BGImageName BGHighlighedImageName:(NSString *)BGHighlighedImageName
{
    KCThemeButton *button = [[KCThemeButton alloc]initWithBGImage:BGImageName BGHighlightedImage:BGHighlighedImageName];
    return button;
}

@end
