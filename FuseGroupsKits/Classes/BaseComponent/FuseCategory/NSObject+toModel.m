//
//  NSObject+toModel.m
//  FUSEPRO
//
//  Created by tancheng on 2019/2/15.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "NSObject+toModel.h"
#import <YYModel/YYModel.h>
@implementation NSObject (toModel)

- (NSMutableArray *)modelWithArray:(NSArray *)arr {
    
    NSMutableArray *models = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id model = [self modelWidthDictionary:obj];
        if (model) {
            [models addObject:model];
        }
    }];
    
    return models;
}

- (id)modelWidthDictionary:(NSDictionary *)dic {
    return [[self class] yy_modelWithDictionary:dic];
}




@end
