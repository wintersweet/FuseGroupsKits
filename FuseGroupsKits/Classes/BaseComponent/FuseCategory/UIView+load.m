//
//  UIView+load.m
//  FUSEPRO
//
//  Created by tancheng on 2019/1/17.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "UIView+load.h"

@implementation UIView (load)

+ (UIView *)loadFromNib {
    NSString *nibName = NSStringFromClass(self);
    return [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil].firstObject;
}

@end
