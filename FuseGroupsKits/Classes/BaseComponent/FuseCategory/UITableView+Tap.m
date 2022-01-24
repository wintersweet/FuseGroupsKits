//
//  UITableView+Tap.m
//  FUSEPRO
//
//  Created by 张虎 on 2019/8/15.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "UITableView+Tap.h"

@implementation UITableView (Tap)

- (void)hideKeyboard{
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboardAction)];
    gestureRecognizer.numberOfTapsRequired = 1;
    gestureRecognizer.cancelsTouchesInView = NO;
    [self addGestureRecognizer:gestureRecognizer];
}

- (void)hideKeyboardAction
{
    [[[[UIApplication sharedApplication] delegate] window] endEditing:YES];
}

@end
