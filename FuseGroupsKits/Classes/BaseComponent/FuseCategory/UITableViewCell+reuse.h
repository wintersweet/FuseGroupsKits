//
//  UITableViewCell+reuse.h
//  FUSEPRO
//
//  Created by tancheng on 2019/10/7.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (reuse)

+ (NSString *)fuse_reuseIndentifier;

+ (NSString *)claseName;

@end

NS_ASSUME_NONNULL_END
