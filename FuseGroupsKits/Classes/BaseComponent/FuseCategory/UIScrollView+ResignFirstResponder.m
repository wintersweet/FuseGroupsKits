//
//  UIScrollView+ResignFirstResponder.m
//  FUSEPRO
//
//  Created by Ch666 on 2018/12/14.
//  Copyright © 2018年 FUSENANO. All rights reserved.
//

#import "UIScrollView+ResignFirstResponder.h"
#import <objc/runtime.h>

@implementation UIScrollView (ResignFirstResponder)

+ (void)load{
    Method originalM = class_getInstanceMethod(self, @selector(scrollViewDidScroll:));
    
    Method switchM = class_getInstanceMethod(self, @selector(ch_scrollViewDidScroll:));
    
    method_exchangeImplementations(originalM, switchM);
}

- (void)ch_scrollViewDidScroll:(UIScrollView *)scrollView{
    //self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}



@end
