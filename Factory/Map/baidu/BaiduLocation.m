//
//  BaiduLocation.m
//  Factory
//
//  Created by zhang on 2018/8/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "BaiduLocation.h"
#import <BMKLocationkit/BMKLocationComponent.h>
@interface BaiduLocation()<BMKLocationManagerDelegate,BMKLocationAuthDelegate>
@property(nonatomic,strong) BMKLocationManager * locationManager;
@end
@implementation BaiduLocation
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[BMKLocationAuth sharedInstance] checkPermisionWithKey:BaiduAK authDelegate:self];
        //初始化实例
        _locationManager = [[BMKLocationManager alloc] init];
        //设置delegate
        _locationManager.delegate = self;
        //设置返回位置的坐标系类型
        _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        //设置距离过滤参数
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        //设置预期精度参数
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //设置应用位置类型
        _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        //设置是否自动停止位置更新
        _locationManager.pausesLocationUpdatesAutomatically = NO;
        //设置是否允许后台定位
        //_locationManager.allowsBackgroundLocationUpdates = YES;
        //设置位置获取超时时间
        _locationManager.locationTimeout = 10;
        //设置获取地址信息超时时间
        _locationManager.reGeocodeTimeout = 10;
        
    }
    return self;
}
-(void)startLocation{
    [self.locationManager setLocatingWithReGeocode:YES];
    [self.locationManager startUpdatingLocation];
}
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didUpdateLocation:(BMKLocation * _Nullable)location orError:(NSError * _Nullable)error

{
    if (error)
    {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
    } if (location) {//得到定位信息，添加annotation
        if (location.location) {
            NSLog(@"LOC = %@",location.location);
        }
        if (location.rgcData) {
            NSLog(@"rgc = %@",[location.rgcData description]);
        }
    }
}
@end
