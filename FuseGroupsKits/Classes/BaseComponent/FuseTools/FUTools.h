//
//  FUTools.h
//  FUSE
//
//  Created by Ch666 on 2017/5/3.
//  Copyright © 2017年 CH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "NSString+utils.h"

#define APP_SECRET @"fuseapp123456"

#define APP_SALT @"fuse"

#define APP_KEY @"fuseApp"

@interface FUTools : NSObject

//验证邮箱
+ (BOOL)isValidateEmail:(NSString *)email;
//判断全是空格
+ (BOOL)isEmptyString:(NSString *)str;

//解析富文本
+ (NSAttributedString *)parseHtml:(NSString *)htmlString;
//验证ktp
+ (BOOL)isValidateKtp:(NSString *)ktp;


//fix bug mym
+ (NSString *)threeSeparteWithDoubleNotUsingUnit:(double)num;

+ (NSString *)threeSeparteWithDouble:(double)num;

+ (NSString *)getPureStringBydelete:(NSString *)inputStr;

+ (UIViewController *)getCurrentVC;


@end
