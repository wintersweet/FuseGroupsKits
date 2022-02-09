//
//  FULocationTool.m
//  FUSEPRO
//
//  Created by Ch666 on 2018/12/7.
//  Copyright © 2018年 FUSENANO. All rights reserved.
//

#import "FULocationTool.h"

@interface FULocationTool ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;


@end

@implementation FULocationTool
//开始定位
- (void)startLocation {
    if ([CLLocationManager locationServicesEnabled]) {
        self.haveLocationService = YES;
        //        CLog(@"--------开始定位");
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        //控制定位精度,越高耗电量越
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 总是授权
        [self.locationManager requestAlwaysAuthorization];
        self.locationManager.distanceFilter = 10.0f;
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager startUpdatingLocation];
    }else{
        self.haveLocationService = NO;
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    self.haveLocationService = NO;
    
    if ([error code] == kCLErrorDenied) {
        NSLog(@"访问被拒绝");
    }
    if ([error code] == kCLErrorLocationUnknown) {
        NSLog(@"无法获取位置信息");
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(fuseLocationFailed)]) {
        [self.delegate fuseLocationFailed];
    }
}

- (void)stopLocation{
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    self.haveLocationService = YES;
    CLLocation *location = [locations lastObject];
    //NSLog(@"location---%@",location);
    CLLocationCoordinate2D curCoordinate2D = location.coordinate;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(fuseCurrentLocation2D:)]) {
        [self.delegate fuseCurrentLocation2D:curCoordinate2D];
    }
    [self.locationManager stopUpdatingLocation];
}


@end
