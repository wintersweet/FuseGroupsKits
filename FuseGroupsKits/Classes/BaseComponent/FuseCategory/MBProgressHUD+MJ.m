//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"

@implementation MBProgressHUD (MJ)

#pragma mark -

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    __block UIView *views = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        //回调或者说是通知主线程刷新，
        if (views == nil){
             views = [UIApplication sharedApplication].delegate.window;
            
        }
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:views animated:YES];
        hud.detailsLabel.text = text;
        // 设置图片
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
        
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        
        // 1秒之后再消失
        [hud hideAnimated:YES afterDelay:2.0f];

        // hud.completionBlock();
    });

    
}


+ (MBProgressHUD *)showTextOnly:(NSString *)message{
    UIWindow *view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];

    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = message;
    hud.detailsLabel.font = [UIFont systemFontOfSize:17.f];
    hud.detailsLabel.textColor = [UIColor grayColor];
    hud.removeFromSuperViewOnHide = YES;
    
    hud.offset = CGPointMake(0.f, 0.f);
    
    [hud hideAnimated:YES afterDelay:2.f];
    return hud;
}
#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    
    __block UIView *views = view;
    __block MBProgressHUD *hud ;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (views == nil)
        {
            views = [UIApplication sharedApplication].delegate.window;

        }
        // 快速显示一个提示信息
        hud = [MBProgressHUD showHUDAddedTo:views animated:YES];;
        hud.label.text = message;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // YES代表需要蒙版效果
        // hud.dimBackground = YES;

        
    });
     return hud;

}

+(MBProgressHUD *)showMessage:(NSString *)message andProgress:(float)progress toView:(UIView *)view
{
    if (view == nil)
        view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = message;
    
    // Update the UI on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeDeterminate;
        hud.progress = progress;
    });
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
   // hud.dimBackground = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    __block UIView *views = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (views == nil)
        
        views = [UIApplication sharedApplication].delegate.window;
        [self hideHUDForView:views animated:NO];
    });

}

+ (void)hideHUDWithMsg:(NSString *)message forView:(UIView *)view{
    __block UIView *views = view;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (views == nil)
        
        views = [UIApplication sharedApplication].delegate.window;
        
        [self hideHUDForView:views animated:NO];
        //sleep(1);
        [self showError:message];

    });
    
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
@end
