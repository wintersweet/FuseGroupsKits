//
//  NSString+utils.h
//  FUSEPRO
//
//  Created by Ch666 on 2018/12/27.
//  Copyright © 2018年 FUSENANO. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "NSObject+FuEmpty.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSString (utils)

//去除字符串左边空格
- (NSString *)stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet;
//去除字符串右边空格
- (NSString *)stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet;

- (CGFloat)getContentHeightWithFont:(UIFont *)font width:(CGFloat)width;

- (CGFloat)getContentWidthWithFont:(UIFont *)font;

- (NSString *)formatNil;

@end

NS_ASSUME_NONNULL_END
