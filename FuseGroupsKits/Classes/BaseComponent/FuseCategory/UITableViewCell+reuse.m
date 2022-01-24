//
//  UITableViewCell+reuse.m
//  FUSEPRO
//
//  Created by tancheng on 2019/10/7.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "UITableViewCell+reuse.h"

@implementation UITableViewCell (reuse)

+ (NSString *)fuse_reuseIndentifier {
    return NSStringFromClass([self class]);
}

+ (NSString *)claseName {
    return NSStringFromClass([self class]);
}

@end
