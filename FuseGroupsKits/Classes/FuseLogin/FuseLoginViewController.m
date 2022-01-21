//
//  FuseLoginViewController.m
//  FuseGroupsKits
//
//  Created by 胡冬冬 on 2022/1/19.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#import "FuseLoginViewController.h"

@interface FuseLoginViewController ()
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation FuseLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.loginBtn];
}

- (void)btnClick{
}
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth-100)*0.5, 220, 100, 40)];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor yellowColor]];
        [_loginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
-(void)btnClick:(UIButton*)btn{
    
}
@end
