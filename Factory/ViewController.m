//
//  ViewController.m
//  Factory
//
//  Created by zhang on 2018/8/13.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ViewController.h"
#import "BaiduManager.h"

@interface ViewController ()

@property(nonatomic,strong)id<MapViewDelegate> mapview;

@property(nonatomic,strong)BaiduManager * mgr;
@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_mapview showPointAnnotation];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _mgr = [[BaiduManager alloc]initWithFrame:self.view.bounds];
    id<MapViewDelegate> mapview =  [_mgr getMapView];
    [mapview mapViewShowToView:self.view];
    _mapview = mapview;
    [_mapview startLocationService];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    id<LocationDelegate> location = [_mgr getLocation];
    [location startLocation];
}



@end
