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
@property (nonatomic, copy) NSString *selectedImageName;

@property (nonatomic, copy) NSString *BGImageName;
@property (nonatomic, copy) NSString *BGSelectedImageName;

- (id)initWithImage:(NSString *)imageName
      selectedImage:(NSString *)selectedImageName;

- (id)initWithBGImage:(NSString *)BGImageName
      BGSelectedImage:(NSString *)BGSelectedImageName;

@end
