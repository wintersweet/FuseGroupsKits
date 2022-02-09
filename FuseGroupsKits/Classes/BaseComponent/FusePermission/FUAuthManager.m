//
//  FUAuthManager.m
//  FUSEPRO
//
//  Created by tancheng on 2019/1/9.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "FUAuthManager.h"
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>
#import <Contacts/Contacts.h>

@implementation FUAuthManager

+ (instancetype)sharedInstance {
    static FUAuthManager *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[FUAuthManager alloc] init];
    });
    return obj;
}

- (void)checkAuth:(FUAuthType)authType handler:(authHandler)handler {
    switch (authType) {
        case FUAuthTypeAlbum:
            [self checkPhotosLibAuth:handler];
            break;
        case FUAuthTypeCamera:
            [self checkCameraAuth:handler];
            break;
        case FUAuthTypeContact:
            [self checkContactAuth:handler];
            break;
        case FUAuthTypeMicrophone:
            [self checkMicrophoneAuth:handler];
        default:
            break;
    }
}

- (void)checkPhotosLibAuth:(authHandler)handler {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {//第一次访问,没有决定
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(true, status == PHAuthorizationStatusAuthorized);
            });
        }];
    }else{
        handler(false, status == PHAuthorizationStatusAuthorized);
    }
}

- (void)checkCameraAuth:(authHandler)handler {
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    if(authStatus == AVAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(true, granted);
            });
        }];
    }else{
        handler(false, authStatus == AVAuthorizationStatusAuthorized);
    }

}

- (void)checkMicrophoneAuth:(authHandler)handler {
    NSString *mediaType = AVMediaTypeAudio;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    if(authStatus == AVAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(true, granted);
            });
        }];
    }else{
        handler(false, authStatus == AVAuthorizationStatusAuthorized);
    }
    
}

- (void)checkContactAuth:(authHandler)handler {
    
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    
    if (status == CNAuthorizationStatusNotDetermined) {
        [[CNContactStore new] requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(true, granted);
            });
        }];
    } else {
         handler(false, status == CNAuthorizationStatusAuthorized);
    }
    
    
    
}


@end
