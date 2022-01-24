//
//  UIBarButtonItem+XJ.m
//  cps
//
//  Created by cai on 16/6/25.
//  Copyright © 2016年 com.guwu. All rights reserved.
//

#import "UIBarButtonItem+XJ.h"
#import "UIView+XJ.h"

@implementation UIBarButtonItem (XJ)

+(instancetype)itemWithNorImage:(NSString *)norImageName higImage:(NSString *)higImageName targe:(id)targe action:(SEL)action
{
    
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 40)];
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.center = bgView.center;
        imgView.image = [UIImage imageNamed:norImageName];
        imgView.bounds = CGRectMake(0, 0, 12, 22);
        [bgView addSubview:imgView];
        // 1.创建按钮
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(0, 0, 30, 40);
        // 2.设置默认状态图片
        
        //[btn setBackgroundImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
        // 3.设置高亮状态图片
        //[btn setBackgroundImage:[UIImage imageNamed:higImageName] forState:UIControlStateHighlighted];
        // 4.设置frame
        //btn.size = btn.currentBackgroundImage.size;
        // 5.添加监听事件
        [btn addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:btn];
        // 6.返回item
        return [[UIBarButtonItem alloc] initWithCustomView:bgView];
    

}

@end
