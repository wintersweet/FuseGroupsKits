//
//  UIBarButtonItem+XJ.h
//  cps
//
//  Created by cai on 16/6/25.
//  Copyright © 2016年 com.guwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XJ)

+(instancetype)itemWithNorImage:(NSString *)norImageName higImage:(NSString *)higImageName targe:(id)targe action:(SEL)action;

@end
