//
//  MapViewDelegate.h
//  Factory
//
//  Created by zhang on 2018/8/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MapViewDelegate <NSObject>
-(void)mapViewShowToView:(UIView*)parentView;//显示地图
-(void)setMapviewDelegate;//设置地图代理
-(void)cancelMapviewDelegate;//取消地图代理
-(void)showPointAnnotation;//显示气泡
-(void)hidePointAnnotation;//隐藏气泡
-(void)startLocationService;//开启定位服务
-(void)stopLocationService;//停止定位服务
@end
