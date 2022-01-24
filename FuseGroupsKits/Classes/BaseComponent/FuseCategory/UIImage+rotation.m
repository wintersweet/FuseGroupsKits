//
//  UIImage+rotation.m
//  FUSE
//
//  Created by Ch666 on 2017/6/1.
//  Copyright © 2017年 CH. All rights reserved.
//

#import "UIImage+rotation.h"

@implementation UIImage (rotation)
- (UIImage *)normalizedImage {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

@end
