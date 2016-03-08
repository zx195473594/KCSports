//
//  KCThemeButton.h
//  KCSports
//
//  Created by KC on 16/3/7.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCThemeButton : UIButton

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *highLightedImageName;

@property (nonatomic, copy) NSString *BGImageName;
@property (nonatomic, copy) NSString *BGHighlightedImageName;

- (id)initWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName;

- (id)initWithBGImage:(NSString *)BGImageName BGHighlightedImage:(NSString *)BGHighlightedImageName;

@end
