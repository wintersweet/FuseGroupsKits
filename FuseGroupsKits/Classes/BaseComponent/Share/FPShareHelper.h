//
//  FPShareHelper.h
//  FUSEPRO
//
//  Created by tancheng on 2020/2/12.
//  Copyright © 2020 FUSENANO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPShareHelper : NSObject

/// 调用系统原生分享, 可分享链接，图片，文本.
+ (void)shareByActivityWithLink:(nullable NSString *)link data:(nullable NSData *)data text:(nullable NSString *)text image:(nullable UIImage *)image completeHandler:(void(^)(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError))completeHandler;

/// 通过copy分享文本
+ (void)shareTextByCopy:(NSString *)text;

/// 是否安装 WhatsApp
+ (BOOL)isInstallWhatsApp;

/// 分享文本到 WhatsApp
+ (void)shareTextToWhatsApp:(NSString *)text;

/// 是否安装 Instagram
+ (BOOL)isInstallInstagram;

/// 分享图片到 Instagram， identifier为相册中的localIdentifier
+ (void)shareImageToInstagram:(NSString *)localIdentifier;

/// 是否安装 Facebook
+ (BOOL)isInstallFacebook;

/// 分享图片到 Facebook， 返回值时bool，表示是否能调起分享
+ (BOOL)shareImageToFacebook:(NSArray <UIImage *> *)images;

/// 分享链接 到Facebook
+ (BOOL)shareLinkToFacebook:(NSString *)link;

@end

NS_ASSUME_NONNULL_END
