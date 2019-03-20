//
//  YSHCodeCountryViewController.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//
#import <SDWebImage/SDImageCache.h>
#import "YSHCodeCountryViewController.h"

@interface YSHCodeCountryViewController ()

@end

@implementation YSHCodeCountryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        [[SDImageCache sharedImageCache] clearMemory];
    }];
    
    
    [self.codeView setPhoneCode:@"86"];
    
    self.codeView.CallBlock = ^{
        
    };
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
