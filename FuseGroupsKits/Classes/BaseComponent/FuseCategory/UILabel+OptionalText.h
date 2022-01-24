//
//  UILabel+OptionalText.h
//  FUSEPRO
//
//  Created by Ch666 on 2018/12/19.
//  Copyright © 2018年 FUSENANO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (OptionalText)

- (void)addOriginalText:(NSString *)orginalText isOptional:(BOOL)optional;

@end

NS_ASSUME_NONNULL_END
