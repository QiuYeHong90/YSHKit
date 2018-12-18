//
//  SDPhotoBrowserVC.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/17.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "SDPhotoBrowserVC.h"

@interface SDPhotoBrowserVC ()

@end

@implementation SDPhotoBrowserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.jjjjssss.maxNum = 99 ;
    
    NSMutableArray * tempArr = @[].mutableCopy;
    for (NSInteger i =0 ; i<self.jjjjssss.maxNum-50 ; i++) {
        [tempArr addObject:@"http://img2.3lian.com/2014/f4/140/d/72.jpg"];
    }
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
