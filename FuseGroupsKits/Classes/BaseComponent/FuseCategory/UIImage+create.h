//
//  UIImage+create.h
//  FUSEPRO
//
//  Created by tancheng on 2019/1/17.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (create)

+ (UIImage *)imageWithColor:(UIColor *)color;

//修改图片颜色
-(UIImage*)imageChangeColor:(UIColor*)color;

- (UIImage*)grayscale:(UIImage*)anImage type:(int)type;

+ (UIImage*)imageFromView:(UIView *)view rect:(CGRect)rect;

+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect;

+(UIImage*)image:(UIImage *)image scaleToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
