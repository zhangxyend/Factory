//
//  BaiduMapView.h
//  Factory
//
//  Created by zhang on 2018/8/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapViewDelegate.h"
@interface BaiduMapView : NSObject<MapViewDelegate>
- (instancetype)initWithFrame:(CGRect)frame;
@end
