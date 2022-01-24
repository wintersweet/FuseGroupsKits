//
//  NSObject+toModel.h
//  FUSEPRO
//
//  Created by tancheng on 2019/2/15.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (toModel)

- (NSMutableArray *)modelWithArray:(NSArray *)arr;

- (id)modelWidthDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
