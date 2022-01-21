//
//  FUSelectTextField.m
//  FUSEPRO
//
//  Created by tancheng on 2019/10/8.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "FUSelectTextField.h"

@implementation FUSelectTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    //方法一：
    // 禁用粘贴功能
    if (action == @selector(paste:))
        return NO; //YES为打开该功能;
    // 禁用选择功能
    if (action == @selector(select:))
        return NO;
    // 禁用全选功能
    if (action == @selector(selectAll:))
        return NO;
    return [super canPerformAction:action withSender:sender];
    
    //方法二：
    // UIMenuController *menuController = [UIMenuController sharedMenuController];
    // if(menuController) {
    // [UIMenuController sharedMenuController].menuVisible=NO;
    // }
    // return NO;
}


@end
