//
//  UITableView+refresh.m
//  FUSEPRO
//
//  Created by tancheng on 2019/1/21.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "UITableView+refresh.h"


@implementation UITableView (refresh)

- (MJRefreshStateHeader *)addHeaderRefresh:(void(^)(void))refreshBlock {
    MJRefreshStateHeader *header = [MJRefreshStateHeader headerWithRefreshingBlock:refreshBlock];
    [header setTitle:@"PULL_DOWN" forState:MJRefreshStateIdle];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"REALSE_REFRESH" forState:MJRefreshStatePulling];
    [header setTitle:@"Loading..." forState:MJRefreshStateRefreshing];
    self.mj_header = header;
    return header;
}

- (MJRefreshBackStateFooter *)addFooterRefresh:(void(^)(void))refreshBlock {
    MJRefreshBackStateFooter *footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:refreshBlock];
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"REALSEA_MORE"forState:MJRefreshStatePulling];
    [footer setTitle:@"Loading..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"NO_DATA" forState:MJRefreshStateNoMoreData];
    self.mj_footer = footer;
    return footer;
}

@end
