//
//  Target_FuseLoginViewController.m
//  FuseGroupsKits
//
//  Created by 胡冬冬 on 2022/1/19.
//

#import "Target_FuseLoginViewController.h"
#import "FuseLoginViewController.h"

@interface Target_FuseLoginViewController ()

@end

@implementation Target_FuseLoginViewController

-(UIViewController*)Action_LoginViewController:(NSDictionary*)params{
    FuseLoginViewController * vc  = [[FuseLoginViewController alloc]init];
    vc.name = params[@"name"];
    vc.age = ((NSNumber *)[params valueForKey:@"age"]).integerValue;
    return vc;
}
@end
