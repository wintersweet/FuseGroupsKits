//
//  UITableView+refresh.h
//  FUSEPRO
//
//  Created by tancheng on 2019/1/21.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN

@interface UITableView (refresh)

- (MJRefreshStateHeader *)addHeaderRefresh:(void(^)(void))refreshBlock;

- (MJRefreshBackStateFooter *)addFooterRefresh:(void(^)(void))refreshBlock;

@end

NS_ASSUME_NONNULL_END
