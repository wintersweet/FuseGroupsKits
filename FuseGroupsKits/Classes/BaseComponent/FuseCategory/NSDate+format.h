//
//  NSDate+format.h
//  FUSEPRO
//
//  Created by tancheng on 2019/6/27.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (format)

- (NSString *)toDateStringWithFormatterString:(NSString *)formatterString;

@end

NS_ASSUME_NONNULL_END
