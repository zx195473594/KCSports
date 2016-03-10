//
//  KCBaseModel.h
//  KCSports
//
//  Created by KC on 16/3/10.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCBaseModel : NSObject<NSCoding>
{
    
}

- (id)initWithDataDic:(NSDictionary*)data;

- (NSDictionary *)attributeMapDictionary;

- (void)setAttributes:(NSDictionary*)dataDic;

- (NSString *)customDescription;

- (NSString *)description;

- (NSData *)getArchivedData;

- (NSString *)cleanString:(NSString *)str;    //清除\n和\r的字符串

@end
