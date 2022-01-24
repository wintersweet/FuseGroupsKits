//
//  UIView+radius.h
//  FUSEPRO
//
//  Created by tancheng on 2019/1/10.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (radius)

- (void)addCornerRadius:(UIRectCorner)corners cornerRadii:(CGSize)radius;

@end

NS_ASSUME_NONNULL_END
