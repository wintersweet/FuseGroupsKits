//
//  UIView+IB.h
//  FUSEPRO
//
//  Created by tancheng on 2019/1/14.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (IB)

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@property (nonatomic, assign) IBInspectable UIColor *borderColor;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic, assign) IBInspectable BOOL maskToBounds;

@property (nonatomic, assign) IBInspectable UIColor* shadowColor;

@property (nonatomic, assign) IBInspectable CGSize shadowOffset;

@property (nonatomic, assign) IBInspectable float shadowOpacity;

@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;

@end

NS_ASSUME_NONNULL_END
