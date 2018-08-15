//
//  BaiduMapView.m
//  Factory
//
//  Created by zhang on 2018/8/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "BaiduMapView.h"

@interface BaiduMapView()<BMKLocationServiceDelegate,BMKMapViewDelegate>
@property(nonatomic,strong) UINavigationController *navigationController;
@property(nonatomic,strong)BMKMapManager* mapManager;
@property(nonatomic,strong)BMKMapView* mapView;
@property(nonatomic,strong)BMKLocationService* locService;
@property(nonatomic,strong)BMKPointAnnotation* annotation;
@end
@implementation BaiduMapView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _mapManager = [[BMKMapManager alloc]init];
        // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
        BOOL ret = [_mapManager start: BaiduAK generalDelegate:nil];
        if (!ret) {
            NSLog(@"manager start failed!");
        }
        _mapView = [[BMKMapView alloc]initWithFrame:frame];
       
        [_mapView setTrafficEnabled:YES];
        _mapView.zoomLevel = 17;//地图显示比例
        // _mapView.showsUserLocation = YES;//显示定位图层
        [_mapView setMapType:BMKMapTypeStandard];
        _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;//设置定位的状态为普通定位模式
    }
    return self;
}

-(void)setMapviewDelegate{
     _mapView.delegate = self;
}
-(void)cancelMapviewDelegate{
     _mapView.delegate = nil;
}
//展示地图
-(void)mapViewShowToView:(UIView *)parentView{
     [parentView addSubview:_mapView];
}
//开启定服务
-(void)startLocationService{
    _locService = [[BMKLocationService alloc]init];
    _locService.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
}
//停止定位服务
-(void)stopLocationService{
    [_locService stopUserLocationService];
    _locService.delegate = nil;
}
//显示定位视图
-(void)showPointAnnotation{
    _annotation = [[BMKPointAnnotation alloc]init];
    [_mapView addAnnotation:_annotation];
}
-(void)hidePointAnnotation{
    [_mapView removeAnnotation:_annotation];
}//隐藏气泡







//实现相关delegate 处理位置信息更新

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    
    [_mapView updateLocationData:userLocation]; //更新地图上的位置
    _annotation.title = userLocation.title;
    _annotation.subtitle =userLocation.subtitle;
    _mapView.centerCoordinate = userLocation.location.coordinate; //更新当前位置到地图中间
    _annotation.coordinate =userLocation.location.coordinate;
   
}
@end
