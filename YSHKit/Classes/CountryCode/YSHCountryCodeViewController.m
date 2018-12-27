//
//  YSHCountryCodeViewController.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import <YYKit/YYKit.h>
#import "YSHSearchCodeViewController.h"
#import "YSHCountryCodeViewController.h"

@interface YSHCountryCodeViewController ()

@end

@implementation YSHCountryCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI
{
    
    [self setNavStyles];
    
    [self pushViewController:[YSHSearchCodeViewController new] animated:NO];
}

//设置导航条样式
- (void)setNavStyles{
    
    
    //设置导航栏标题颜色和大小
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"333333"], NSFontAttributeName:[UIFont systemFontOfSize:18.0f]}];
    
    //设置导航栏背景色
    
    self.navigationBar.backgroundColor = [UIColor redColor];
    
    self.navigationBar.barTintColor = [UIColor colorWithHexString:@"00AE68"];
    
//    self.navigationBar
//    [self.navigationBar setBackgroundImage: [UIImage imageNamed:@"daohang"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:nil];
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
