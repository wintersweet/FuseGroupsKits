//
//  FUAuthManager.h
//  FUSEPRO
//
//  Created by tancheng on 2019/1/9.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    FUAuthTypeAlbum,   //相册
    FUAuthTypeCamera,  //相机
    FUAuthTypeContact,  //通讯录
    FUAuthTypeMicrophone //麦克风
} FUAuthType;

typedef void(^authHandler)(BOOL isFirst, BOOL granted);

NS_ASSUME_NONNULL_BEGIN

@interface FUAuthManager : NSObject

+ (instancetype)sharedInstance;

/**
 * @brief 权限检查
 *
 * @parameters authType 权限类型(如：相册权限)
 *
 * @parameters handler(bool, bool) 第一个参数：是否是第一次访问；第二个参数：是否授权
 */

- (void)checkAuth:(FUAuthType)authType
          handler:(authHandler)handler;

@end

NS_ASSUME_NONNULL_END
