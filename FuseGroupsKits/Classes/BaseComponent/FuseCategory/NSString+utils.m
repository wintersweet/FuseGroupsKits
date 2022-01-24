//
//  NSString+utils.m
//  FUSEPRO
//
//  Created by Ch666 on 2018/12/27.
//  Copyright © 2018年 FUSENANO. All rights reserved.
//

#import "NSString+utils.h"
#import <FUTools.h>
@implementation NSString (utils)
- (NSString *)stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet{
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer range:NSMakeRange(0, length)];
    
    for (NSInteger i = 0; i < length; i++) {
        if (![characterSet characterIsMember:charBuffer[i]]) {
            location = i;
            break;
        }
    }
    return [self substringWithRange:NSMakeRange(location, length - location)];
}


- (NSString *)stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet{
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer range:NSMakeRange(0, length)];
    
    NSUInteger subLength = 0;
    for (NSInteger i = length; i > 0; i--) {
        if (![characterSet characterIsMember:charBuffer[i - 1]]) {
            subLength = i;
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(0, subLength)];
}


- (CGFloat)getContentHeightWithFont:(UIFont *)font width:(CGFloat)width {
    
    if ([FUTools isEmptyString:self]) {
        return 0;
    }
    
    NSDictionary *attrDic = @{NSFontAttributeName: font};
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
    CGFloat height = rect.size.height;
    
    return ceil(height);
}

- (CGFloat)getContentWidthWithFont:(UIFont *)font{
    
    if ([FUTools isEmptyString:self]) {
        return 0;
    }
    
    NSDictionary *attrDic = @{NSFontAttributeName: font};
    CGSize size = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
    
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
    CGFloat width = rect.size.width;
    
    return ceil(width);
}

- (NSString *)formatNil {
    if (!self) {
        return @"";
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return self;
}


@end
