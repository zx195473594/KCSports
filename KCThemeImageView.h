//
//  KCThemeImageView.h
//  KCSports
//
//  Created by KC on 16/3/9.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCThemeImageView : UIImageView

@property (nonatomic, copy) NSString *imageName;

- (id)initWithImageName:(NSString *)imageName;
@end
