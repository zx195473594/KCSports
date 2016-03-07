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
    _txField = [[UITextField alloc] initWithFrame:CGRectMake(0.12 * ScreenWidth, 0.12 * ScreenWidth, 0.4 * ScreenWidth, 0.1*ScreenWidth)];
    _txField.borderStyle = UITextBorderStyleRoundedRect;
    _txField.placeholder = @"请输入采样距离";
    _txField.backgroundColor = [UIColor whiteColor];
    _txField.keyboardType = UIKeyboardTypeNumberPad;
    [_txField sizeToFit];
    [self.view addSubview:_txField];
    
    // 定位开始按钮
    UIButton *locateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    locateButton.backgroundColor = [UIColor whiteColor];
    locateButton.frame = CGRectMake(0.65 * ScreenWidth, 50, 80, 30);
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
    
//    NSLog(@"lastLA = %f, lastLO = %f, newLA = %f, newLO = %f",_lastLocationPoint.coordinate.latitude,_lastLocationPoint.coordinate.longitude,_newLocationPoint.coordinate.latitude,_newLocationPoint.coordinate.longitude);
    
    CLLocationCoordinate2D coordinates[2];
    
    coordinates[0].latitude = _lastLocationPoint.coordinate.latitude;
    coordinates[0].longitude = _lastLocationPoint.coordinate.longitude;
    
    coordinates[1].latitude = _newLocationPoint.coordinate.latitude;
    coordinates[1].longitude = _newLocationPoint.coordinate.longitude;
    
    MAPolyline *polyline = [MAPolyline polylineWithCoordinates:coordinates count:2];

    [_mapView addOverlay:polyline];
    
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    
    NSLog(@"%@",userLocation.location);
    NSLog(@"%@",_lastLocationPoint);
        if(updatingLocation)
    {
        float x = userLocation.coordinate.latitude - _lastLocationPoint.coordinate.latitude;
        float y = userLocation.coordinate.longitude - _lastLocationPoint.coordinate.longitude;

            // 1.将新获得的坐标赋值给_newLocationPoint
            _newLocationPoint = [userLocation.location copy];
            
            NSLog(@"lastLA = %f, lastLO = %f, newLA = %f, newLO = %f",_lastLocationPoint.coordinate.latitude,_lastLocationPoint.coordinate.longitude,_newLocationPoint.coordinate.latitude,_newLocationPoint.coordinate.longitude);
            // 2.定位获得坐标后开始画线 (从_lastLocationPoint到_newLocationPoint)

                [self _drawLines];
            
            
            // 3.画线完毕后将_newLocationPoint赋值给_lastLocationPoint
            
            _lastLocationPoint = _newLocationPoint;

        
        
    }
    
    
}

- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id <MAOverlay>)overlay
{
    [_mapView removeOverlay:overlay];
    if ([overlay isKindOfClass:[MAPolyline class]])
    {
        MAPolylineView *polylineView = [[MAPolylineView alloc] initWithPolyline:overlay];
        
        polylineView.lineWidth = 5.f;
        polylineView.strokeColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.6];

        return polylineView;
    }
    return nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
