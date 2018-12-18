//
//  SDPhotoBrowserVC.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/17.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHTableViewCell.h"
#import "SDPhotoBrowserVC.h"

@interface SDPhotoBrowserVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SDPhotoBrowserVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    self.jjjjssss.maxNum = 99 ;
//
//
//    [self reloadUI:NO];
//    __weak typeof(self) weakSelf = self ;
//    self.jjjjssss.CallBackIsOpenImgs = ^(BOOL isOpen) {
//        [weakSelf reloadUI:isOpen];
//    };
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30 ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSHTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"YSHTableViewCell"];
    __weak typeof(self) weakSelf = self ;
    self.jjjjssss = cell.dy_contentView ;
    self.jjjjsss_h = cell.dy_contentView_h ;
    [self reloadUI:NO];
    cell.dy_contentView.CallBackIsOpenImgs = ^(BOOL isOpen) {
        [weakSelf.tableView reloadData];
        [weakSelf reloadUI:isOpen];
    };
    
    return cell ;
}

-(void)reloadUI:(BOOL)isOpen
{
    
    NSMutableArray * tempArr = @[].mutableCopy;
    for (NSInteger i =0 ; i<self.jjjjssss.maxNum-50 ; i++) {
        [tempArr addObject:@"http://img2.3lian.com/2014/f4/140/d/72.jpg"];
    }
    self.jjjjssss.isOpen = isOpen ;
    __weak typeof(self) weakSelf = self ;
    [self.jjjjssss picPathStringsArray:tempArr callBlock:^(CGFloat h, BOOL isReload) {
        weakSelf.jjjjsss_h.constant = h ;
    }];
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
