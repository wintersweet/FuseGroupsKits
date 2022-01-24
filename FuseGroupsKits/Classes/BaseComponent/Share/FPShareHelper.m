//
//  FPShareHelper.m
//  FUSEPRO
//
//  Created by tancheng on 2020/2/12.
//  Copyright © 2020 FUSENANO. All rights reserved.
//

#import "FPShareHelper.h"

#import <Social/Social.h>
#import <FUTools.h>
// facebook sdk
#import <FBSDKShareKit/FBSDKShareKit.h>


@interface FPShareHelper ()


@end

@implementation FPShareHelper

#pragma mark - 系统组件分享

+ (void)shareByActivityWithLink:(nullable NSString *)link data:(nullable NSData *)data text:(nullable NSString *)text image:(nullable UIImage *)image completeHandler:(void(^)(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError))completeHandler{
    
    NSURL *shareURL = [NSURL URLWithString:link];
    NSMutableArray *activityItems = @[].mutableCopy;
    if (data) {
        [activityItems addObject:data];
    }
    if (shareURL) {
        [activityItems addObject:shareURL];
    }
    if (text) {
        [activityItems addObject:text];
    }
    if (image) {
        [activityItems addObject:image];
    }

    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:[activityItems copy] applicationActivities:nil];
    
    UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
        if (completeHandler) {
            completeHandler(activityType,completed,returnedItems,activityError);
        }
        if (completed) {
            [vc dismissViewControllerAnimated:YES completion:nil];
        }
        
    };
    
    vc.completionWithItemsHandler = myBlock;
    
    [self presentActivity:vc];
    
}


+ (void)presentActivity:(UIActivityViewController *)activity {
    
    [[FUTools getCurrentVC] presentViewController:activity animated:YES completion:^{

    }];
    if (@available(iOS 13.0 , *)) {//iOS 13 的结构发生了变化，系统适配有问题
        for (UIViewController *child in activity.childViewControllers) {
            if ([child isKindOfClass:[UINavigationController class]]) {
                UIViewController *contentVc = ((UINavigationController *)child).viewControllers.firstObject;
                for (UIView *vi in contentVc.view.subviews) {
                    if ([vi isKindOfClass:[UICollectionView class]]) {
                        ((UICollectionView *)vi).contentInset = UIEdgeInsetsMake(72, 0, 0, 0);
                        [((UICollectionView *)vi) setContentOffset:CGPointMake(0, -72)];
                        break;
                    }
                }
                break;
            }
        }
    }
}

/// 通过copy分享文本
+ (void)shareTextByCopy:(NSString *)text {
    [UIPasteboard generalPasteboard].string = text;
}

#pragma mark - 通过URL 分享 文本
/// 是否安装 WhatsApp
+ (BOOL)isInstallWhatsApp {
    NSURL *whatsAppURL = [NSURL URLWithString:@"whatsapp://app"];
    return [[UIApplication sharedApplication] canOpenURL:whatsAppURL];
}

/// 分享文本到 WhatsApp
+ (void)shareTextToWhatsApp:(NSString *)text {
    NSString *urlString = [NSString stringWithFormat:@"whatsapp://send?text=%@",text];
    NSURL *whatsAppUrl = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:whatsAppUrl]) {
        [[UIApplication sharedApplication] openURL:whatsAppUrl];
    }
}

/// 是否安装 Instagram
+ (BOOL)isInstallInstagram {
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];
    return [[UIApplication sharedApplication] canOpenURL:instagramURL];
}

/// 分享图片到 Instagram， identifier为相册中的localIdentifier
+ (void)shareImageToInstagram:(NSString *)localIdentifier {
    NSString *urlString = [NSString stringWithFormat:@"instagram://library?LocalIdentifier=%@",localIdentifier];
    NSURL *insUrl = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:insUrl]) {
        [[UIApplication sharedApplication] openURL:insUrl];
    }
}

#pragma mark - 通过SDK分享

/// 是否安装 Facebook
+ (BOOL)isInstallFacebook {
    NSURL *fbURL = [NSURL URLWithString:@"fbshareextension://app"];
    return [[UIApplication sharedApplication] canOpenURL:fbURL];
}

/// 分享图片到 Facebook
+ (BOOL)shareImageToFacebook:(NSArray <UIImage *> *)images {
    
    NSMutableArray <FBSDKSharePhoto *>*sharePhotos = @[].mutableCopy;
    for (UIImage *img in images) {
        FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
        photo.image = img;
        photo.userGenerated = YES;
        [sharePhotos addObject:photo];
    }
    
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = sharePhotos;
    
    FBSDKShareDialog *dialog = [FBSDKShareDialog new];
    dialog.fromViewController = [FUTools getCurrentVC];
    dialog.shareContent = content;
    dialog.mode = FBSDKShareDialogModeAutomatic;
    
    return [dialog show];
}

/// 分享链接 到Facebook
+ (BOOL)shareLinkToFacebook:(NSString *)link {

    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:link];
    
    FBSDKShareDialog *dialog = [FBSDKShareDialog new];
    dialog.fromViewController = [FUTools getCurrentVC];
    dialog.shareContent = content;
    dialog.mode = FBSDKShareDialogModeAutomatic;
    
    return [dialog show];
}

@end
