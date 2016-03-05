//
//  KCThirdViewController.m
//  KCSports
//
//  Created by 坏蛋臭臭懒 on 16/3/3.
//  Copyright © 2016年 Yang Li. All rights reserved.
//

#import "KCThirdViewController.h"

@interface KCThirdViewController ()

@end

@implementation KCThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"3";
    
    [MAMapServices sharedServices].apiKey = @"110b80fe37fa086f33b4a92ae0c78d0e";
    
    // 加载视图
    [self _initViews];
    
    _arrayLocations = [NSMutableArray array];
}

- (void)_initViews
{
    // 初始化输入指令视图
    float H = (ScreenHeight - 49 - 44) / 4;
    _inputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, H)];
    _inputView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_inputView];
    
    // 向指令视图中添加label和设置按钮
    [self _initTextFieldAndButton];
    
    // 初始化地图view
    _mapV = [[UIView alloc]initWithFrame:CGRectMake(0, H, ScreenWidth, 3 * H)];
    _mapV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_mapV];
    
    // 初始化高德地图
    _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, _mapV.height)];
    _mapView.delegate = self;
    
    
    [_mapV addSubview:_mapView];
}

- (void)_initTextFieldAndButton
{
    // 输入框
    _txField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 150, 30)];
    _txField.borderStyle = UITextBorderStyleRoundedRect;
    _txField.placeholder = @"请输入采样距离";
    _txField.backgroundColor = [UIColor whiteColor];
    _txField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_txField];
    
    // 定位开始按钮
    UIButton *locateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    locateButton.backgroundColor = [UIColor whiteColor];
    locateButton.frame = CGRectMake(250, 50, 80, 30);
    [locateButton setTitle:@"开始定位" forState:UIControlStateNormal];
    [locateButton addTarget:self action:@selector(startLocating:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:locateButton];
}

#pragma mark - Actions
// 定位
- (void)startLocating:(UIButton *)button
{
    _stepCount = [_txField.text intValue];
    
    // 开始定位
    _mapView.showsUserLocation = YES;
    _mapView.zoomLevel = 18;
    [_mapView setUserTrackingMode:MAUserTrackingModeFollow];
    _mapView.pausesLocationUpdatesAutomatically = NO;
    
    _mapView.allowsBackgroundLocationUpdates = YES;//iOS9以上系统必须配置
    
}

- (void)_drawLines
{
    NSInteger count = _arrayLocations.count;
    CLLocationCoordinate2D coordinates[count];
    
    for (int i = 0; i < count; i ++) {
        MAUserLocation *location = _arrayLocations[i];
        coordinates[i].latitude = location.coordinate.latitude;
        
        coordinates[i].longitude = location.coordinate.longitude;
        NSLog(@"%f,%f",coordinates[i].latitude,coordinates[i].longitude);
        
    }
//    coordinates[0].latitude = 39.781892;
//    coordinates[0].longitude = 116.293413;
//    
//    coordinates[1].latitude = 39.787600;
//    coordinates[1].longitude = 116.391842;
//    
//    coordinates[2].latitude = 39.733187;
//    coordinates[2].longitude = 116.417932;
//    
//    coordinates[3].latitude = 39.704653;
//    coordinates[3].longitude = 116.338255;
    MAPolyline *polyline = [MAPolyline polylineWithCoordinates:coordinates count:count];

    [_mapView addOverlay:polyline];
    
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
//        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        if (_arrayLocations.count < 5) {
            [_arrayLocations addObject:userLocation];
        }
        else
        {
            [_arrayLocations removeObjectAtIndex:0];
            [_arrayLocations addObject:userLocation];
        }
        
    }
//    NSLog(@"%@",_arrayLocations);
    
    // 定位获得坐标后开始画线
    [self _drawLines];

}

- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id <MAOverlay>)overlay
{
    [_mapView removeOverlay:overlay];
    if ([overlay isKindOfClass:[MAPolyline class]])
    {
        MAPolylineView *polylineView = [[MAPolylineView alloc] initWithPolyline:overlay];
        
        polylineView.lineWidth = 5.f;
        polylineView.strokeColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.6];
//        polylineView.lineJoinType = kMALineJoinRound;//连接类型
//        polylineView.lineCapType = kMALineCapRound;//端点类型
        
        return polylineView;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
