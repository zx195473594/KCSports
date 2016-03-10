//
//  KCUIFactory.h
//  KCSports
//
//  Created by KC on 16/3/7.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCThemeButton.h"
#import "KCThemeLabel.h"

@interface KCUIFactory : KCThemeButton

// 创建带图片的主题按钮
+ (KCThemeButton *)createButtonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

// 创建带背景图的主题按钮
+ (KCThemeButton *)createButtonWithBGImageName:(NSString *)BGImageName
                           BGSelectedImageName:(NSString *)BGSelectedImageName;

+ (KCThemeLabel *)createLabelWithColorName:(NSString *)colorName;
@end
