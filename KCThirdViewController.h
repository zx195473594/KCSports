//
//  KCThirdViewController.h
//  KCSports
//
//  Created by 坏蛋臭臭懒 on 16/3/3.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCBaseViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface KCThirdViewController : KCBaseViewController<MAMapViewDelegate>
{
    UIView  *_inputView;  // 输入视图
    UIView  *_mapV;    // 地图视图
    
    MAMapView *_mapView;
    NSMutableArray *_arrayLocations;
    NSArray *_arrayPoly;
    
    UITextField *_txField;

    CLLocation *_lastLocationPoint;  // 上一个定位坐标点
    CLLocation *_newLocationPoint;   // 新获得的定位坐标点
    
    float step;
}

@end
