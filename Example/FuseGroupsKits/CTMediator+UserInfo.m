//
//  CTMediator+UserInfo.m
//  FuseGroupsKits_Example
//
//  Created by 胡冬冬 on 2022/1/20.
//  Copyright © 2022 wintersweet. All rights reserved.
//

#import "CTMediator+UserInfo.h"

@implementation CTMediator(UserInfo)
- (UIViewController *)loginViewController:(NSString *)name age:(NSInteger)age{

    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:name forKey:@"name"];
    [dic setValue:@(age) forKey:@"age"];
    return [self performTarget:@"FuseLoginViewController" action:@"LoginViewController" params:dic shouldCacheTarget:NO];
}

@end
