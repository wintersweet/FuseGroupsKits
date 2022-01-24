//
//  NSObject+FuEmpty.m
//  FUSEPRO
//
//  Created by tancheng on 2019/3/6.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "NSObject+FuEmpty.h"

@implementation NSObject (FuEmpty)

- (BOOL)isEmpty {
    
    if (self == nil || self == NULL) {
        return true;
    }
    
    if ([self isKindOfClass:[NSNull class]]) {
        return true;
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self stringByTrimmingCharactersInSet:[NSMutableCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
            return true;
        }
    }
    return false;
}

@end
