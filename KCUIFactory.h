//
//  KCUIFactory.h
//  KCSports
//
//  Created by KC on 16/3/7.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCThemeButton.h"
#import "KCThemeButton.h"
@interface KCUIFactory : KCThemeButton

// 创建带图片的主题按钮
+ (KCThemeButton *)createButtonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highLightedImageName;

// 创建带背景图的主题按钮
+ (KCThemeButton *)createButtonWithBGImageName:(NSString *)BGImageName BGHighlighedImageName:(NSString *)BGHighlighedImageName;

@end
