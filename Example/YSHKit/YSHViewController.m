//
//  YSHViewController.m
//  YSHKit
//
//  Created by 793983383@qq.com on 12/13/2018.
//  Copyright (c) 2018 793983383@qq.com. All rights reserved.
//


//#import <>
//#import <>
#import "YSHViewController.h"

@interface YSHViewController ()<UITableViewDataSource,UITableViewDelegate>

/**
 @{
 @"title":@"",
 @"toVC":@"",
 }
 */
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation YSHViewController


-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"YSHKit";
	// Do any additional setup after loading the view, typically from a nib.
    [self.dataArray setArray:@[
                               @{
                                   @"title":@"SHProgressHUD",
                                   @"toVC":@"YSHHUDVC",
                                   },
                               @{
                                   @"title":@"YSHTextField",
                                   @"toVC":@"YSHTextFieldVC",
                                   },
                               @{
                                   @"title":@"SDPhotoBrowser",
                                   @"toVC":@"SDPhotoBrowserVC",
                                   },
                               @{
                                   @"title":@"国家代码",
                                   @"toVC":@"YSHCodeCountryViewController",
                                   },
                               ]];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    }
    
    NSDictionary * dict = self.dataArray[indexPath.row];
    cell.textLabel.text = dict[@"title"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dict = self.dataArray[indexPath.row];
    NSString * toVCStr = dict[@"toVC"];
    UIViewController * toVC =  [self.storyboard instantiateViewControllerWithIdentifier:toVCStr];
    toVC.title = dict[@"title"];
    [self.navigationController pushViewController:toVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
