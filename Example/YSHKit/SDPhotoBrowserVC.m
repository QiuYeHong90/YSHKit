//
//  SDPhotoBrowserVC.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/17.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import <SDWebImage/SDImageCache.h>
#import "YSHTableViewCell.h"
#import "SDPhotoBrowserVC.h"

@interface SDPhotoBrowserVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation SDPhotoBrowserVC
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    self.jjjjssss.maxNum = 99 ;
//
//
    
   
    
    
    
    NSString * url = @"http://vn.cqdunyue.com/FgKfuibFtb00PwY_tqIajg4j3BEa,http://vn.cqdunyue.com/Fi8mNgssXDwvQDoOO5vAVXJVVpST,http://vn.cqdunyue.com/Fr2WnT723Ks6_J0VMpf8CLeIkEsq,http://vn.cqdunyue.com/FqTlsf-C8rf5pJ7sS5_4-8fPR3fm,http://vn.cqdunyue.com/FrTCKcuhU2cUnz0jpi7oOSmxt6G0,http://vn.cqdunyue.com/FlDrLbQ019bY1348I1iz74PLtyHZ,http://vn.cqdunyue.com/Fvg2RLU4QjEyo2UHDA_sPgxqENQa,http://vn.cqdunyue.com/Fr-YdvHF6cmArKOELDdSbsydU0u5,http://vn.cqdunyue.com/FlCpYyRfTAd0ubTIAIQrd_S72DBo,http://vn.cqdunyue.com/FqjOXMUu8lVUnAu_FU8d-VyDgoOS,http://vn.cqdunyue.com/FpdfbYPVmOPCt2mOrLaTsyB9TM8D,http://vn.cqdunyue.com/FjsjIlB-sF2reO67cjEmxJMjIgL9,http://vn.cqdunyue.com/FjcnPQymzjcaWPRwY7H53_w_JaJB,http://vn.cqdunyue.com/FpwFkCFsaKc4p0qE4v7ALcJmzh15,http://vn.cqdunyue.com/FhPjqre22uHKUt-2O3bj-_eD7rmU,http://vn.cqdunyue.com/FrSi0zfcpKQERZR52GKfl510yRDU,http://vn.cqdunyue.com/FrSi0zfcpKQERZR52GKfl510yRDU,http://vn.cqdunyue.com/Ft0JNMEd8ertWFTOfnjzZst7nuxz,http://vn.cqdunyue.com/Fn3sVn9SKa6vco80AVkFIJtveKpL,http://vn.cqdunyue.com/Fr31Q_vAGvwgU-B0vTO8vOLEPGO7,http://vn.cqdunyue.com/Fv-B0fOnryPH_bntxYDcdrMitjHE,http://vn.cqdunyue.com/Fl7zKGscsAZhwXCOi5IqlYM0Fwni,http://vn.cqdunyue.com/Fn3sVn9SKa6vco80AVkFIJtveKpL,http://vn.cqdunyue.com/FrqtU9jR96pyLFh3bpJJf8B-UAVS,http://vn.cqdunyue.com/FhSKmybumCBpqc0VPhS5ETy_-Rk4,http://vn.cqdunyue.com/FqzSIpwbDnnb9y--buI625xPcAZb,http://vn.cqdunyue.com/FqvzSrXonZuNdoCsEJViUcTG4NRQ,http://vn.cqdunyue.com/FjAcFcUeCy3p9t0Zl3hG9DBfF4At,http://vn.cqdunyue.com/FlWm2d0N47AFlX3Tbck7fSebg-7t,http://vn.cqdunyue.com/FpXpbJeHMiuHRBCbqISmFx7zadK-,http://vn.cqdunyue.com/FjLnKgWmQZL1mf0g0hoTIsV-YAdu,http://vn.cqdunyue.com/Foa5DyHZqslBifMvJSd2KS8QxJSm,http://vn.cqdunyue.com/FixPZV8LbmVy5PPExnacNsX9KHQp,http://vn.cqdunyue.com/Fu7h5F8hUmoCvW_IQkC_gOuTkKgi,http://vn.cqdunyue.com/Fu7h5F8hUmoCvW_IQkC_gOuTkKgi,http://vn.cqdunyue.com/FuGavtT8COScVU2-fBWZMqbxTsov,http://vn.cqdunyue.com/Fts0dwA6maGjw6Nlpm2nVxoup_r_,http://vn.cqdunyue.com/Fg9a9GcgnbT485HB-4gM-M8jQeCa,http://vn.cqdunyue.com/FvaBR33yhKs2TNhrOvqIUKK0fIsS,http://vn.cqdunyue.com/FhCX-Et2DGZv39LvRcca8O3-4X9-,http://vn.cqdunyue.com/FrmYVRWaYVgErrVsa9CEd-3Buk5v,http://vn.cqdunyue.com/FnwWlwilaKhozmYaUnBy87MSuF6u,http://vn.cqdunyue.com/FiC5WtnhZBlh0jX4uJ4vbbUiswD4,http://vn.cqdunyue.com/FpPWgXP_EKg7m6EGfr8xaIlSO8II,http://vn.cqdunyue.com/Fo99Lm_oEdHuBfRYLQfMGerwP-Th,http://vn.cqdunyue.com/FnffFWY_9L-NhtiaE_PVI5DBQwSW,http://vn.cqdunyue.com/FqgeRzVVgQ_sxcqfoKrbuBw3lu1Y,http://vn.cqdunyue.com/FobLqf03ATDosd8-vUYpvhXnG21B,http://vn.cqdunyue.com/FrTGaW0wWCkuwOGIGeOVgbWBzAH4,http://vn.cqdunyue.com/FqGec-nVn0JCYumGZvE6ws-zsr59";
    
        NSArray * tempArr = [url componentsSeparatedByString:@","];
    
    //    [self reloadUI:NO];
    
    
        for (NSInteger i = 0; i<50; i++) {
            
            NSMutableArray * tempArr1 = @[].mutableCopy;
            if (tempArr.count!=i) {
                for (NSInteger j=0; j<=i; j++) {
                    [tempArr1 addObject:tempArr[j]];
                }
            }else{
                tempArr1 = tempArr.mutableCopy;
            }
            NSMutableDictionary * dict = @{
                                    @"imgArr":tempArr1,
                                    @"isOpen":@(NO),
                                    }.mutableCopy;
            [self.dataArray addObject:dict];
        }
    
        [self.tableView reloadData];
    
    
    
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSHTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"YSHTableViewCell"];
    __weak typeof(self) weakSelf = self ;
   
    
    NSMutableDictionary * dict = self.dataArray[indexPath.row];
    
    __weak YSHTableViewCell * weakCell = cell;
    NSMutableArray * tempArr = dict[@"imgArr"];
    cell.dy_contentView.isOpen = [dict[@"isOpen"] boolValue];
  
    [cell.dy_contentView picPathStringsArray:tempArr callBlock:^(CGFloat h, BOOL isReload) {
        if (isReload) {
            [weakSelf.tableView reloadData];
          
        }else{
            weakCell.dy_contentView_h.constant = h ;
            [weakCell layoutIfNeeded];
        }
        
    }];
    
    __block NSMutableDictionary * bDict = dict;
//    cell.
    
    cell.dy_contentView.CallBackIsOpenImgs = ^(BOOL isOpen) {
        bDict[@"isOpen"] = @(isOpen);
        [weakSelf.tableView reloadData];
        [weakSelf.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
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
