//
//  ManagerDelegate.h
//  Factory
//
//  Created by zhang on 2018/8/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapViewDelegate.h"
#import "LocationDelegate.h"
@protocol ManagerDelegate <NSObject>
-(id<MapViewDelegate>)getMapView;
-(id<LocationDelegate>)getLocation;
@end
