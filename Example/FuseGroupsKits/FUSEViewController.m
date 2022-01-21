//
//  FUSEViewController.m
//  FuseGroupsKits
//
//  Created by wintersweet on 01/19/2022.
//  Copyright (c) 2022 wintersweet. All rights reserved.
//

#import "FUSEViewController.h"
#import <CTMediator+UserInfo.h>
@interface FUSEViewController ()
@property (nonatomic, strong) UIButton *perInfoBtn;

@end

@implementation FUSEViewController

- (void)viewDidLoad
{
 
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.perInfoBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}
-(UIButton *)perInfoBtn{
    if (!_perInfoBtn) {
        _perInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 40)];
        [_perInfoBtn setTitle:@"个人详情" forState:UIControlStateNormal];
        [_perInfoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_perInfoBtn setBackgroundColor:[UIColor greenColor]];
        [_perInfoBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _perInfoBtn;
}
-(void)btnClicked{
    UIViewController * vc = [[CTMediator sharedInstance] loginViewController:@"name" age:12];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
