//
//  UIViewController+Insert.m
//  FUSEPRO
//
//  Created by Ch666 on 2018/12/29.
//  Copyright © 2018年 FUSENANO. All rights reserved.
//

#import "UIViewController+Insert.h"
#import <objc/runtime.h>
@implementation UIViewController (Insert)
+ (void)load {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector= @selector(FL_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class,originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
        method_exchangeImplementations(originalMethod,swizzledMethod);
        
    });
}

- (void)FL_viewWillAppear:(BOOL)animated {
    
    [self FL_viewWillAppear:animated];
    UIScrollView *scrollView = nil;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]]|| [view isKindOfClass:[UIScrollView class]]) {
            scrollView = (UIScrollView *)view;
            break;
        }
    }
    //if (!self.automaticallyAdjustsScrollViewInsets) {
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
   // }
//    else {
//        if (@available(iOS 11.0, *)) {
//            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
//        }
//    }
}

- (void)FL_setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets {
    
    [self FL_setAutomaticallyAdjustsScrollViewInsets:automaticallyAdjustsScrollViewInsets];
    
}


@end
