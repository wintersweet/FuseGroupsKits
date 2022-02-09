//
//  FULocationTool.h
//  FUSEPRO
//
//  Created by Ch666 on 2018/12/7.
//  Copyright © 2018年 FUSENANO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol FuseCurrentLoctionDelegate <NSObject>

- (void)fuseCurrentLocation2D:(CLLocationCoordinate2D)CLLocationCoordinate2D;

- (void)fuseLocationFailed;

@end

@interface FULocationTool : NSObject

@property (nonatomic, assign)id<FuseCurrentLoctionDelegate>delegate;
@property (nonatomic, assign) BOOL haveLocationService;

- (void)startLocation;
- (void)stopLocation;

@end

NS_ASSUME_NONNULL_END
