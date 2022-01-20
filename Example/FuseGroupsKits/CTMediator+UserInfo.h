//
//  CTMediator+UserInfo.h
//  FuseGroupsKits_Example
//
//  Created by 胡冬冬 on 2022/1/20.
//  Copyright © 2022 wintersweet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CTMediator/CTMediator.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator(UserInfo)
- (UIViewController *)loginViewController:(NSString *)name age:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END
