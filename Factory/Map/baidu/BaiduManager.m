//
//  BaiduManager.m
//  Factory
//
//  Created by zhang on 2018/8/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "BaiduManager.h"
#import "BaiduMapView.h"
#import "BaiduLocation.h"
@interface BaiduManager()
@property(nonatomic,strong)BaiduMapView * mapView;
@end
@implementation BaiduManager
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _mapView = [[BaiduMapView alloc]initWithFrame:frame];
    }
    return self;
}
-(id<MapViewDelegate>)getMapView{
    return _mapView;
}
-(id<LocationDelegate>)getLocation{
    return [[BaiduLocation alloc]init];
}
@end
