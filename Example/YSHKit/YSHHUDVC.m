//
//  YSHHUDVC.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/13.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHHUDVC.h"

@interface YSHHUDVC ()

@end

@implementation YSHHUDVC
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.dataArray setArray:@[
                               @{
                                   @"title":@"错误提示",
                                   @"toVC":@"HUDVC",
                                   },
                               @{
                                   @"title":@"风火轮，菊花",
                                   @"toVC":@"HUDVC",
                                   },
                               @{
                                   @"title":@"简单的菊花加上简单的文字",
                                   @"toVC":@"HUDVC",
                                   },
                               @{
                                   @"title":@"简单的菊花加上简单的文字和复杂的文字",
                                   @"toVC":@"HUDVC",
                                   },
                               @{
                                   @"title":@"蛋糕状读条器",
                                   @"toVC":@"HUDVC",
                                   }
                               ]];
    
    [self.tableView reloadData];
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
   
    
   
        
        switch (indexPath.row) {
            case 0:
            {
                [SHProgressHUD showError:@"错误提示"];
            }
                break;
            case 1:
            {
                [SHProgressHUD showSingleWheelInView:self.view];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SHProgressHUD hideHUD];
                });
                
            }
                break;
            case 2:
            {
                
                [SHProgressHUD showSingeWheelWithMsg:@"SHProgressView"    view:nil];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SHProgressHUD hideHUD];
                });
                
                
            }
                break;
            case 3:
            {
                
                [SHProgressHUD showSingleWheelWithSingelMsg:@"SHProgressView" detailMsg:@"复杂消息" view:nil];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SHProgressHUD hideHUD];
                });
                
                
            }
                break;
            case 4:
            {
                
                [SHProgressHUD showSingleProgressView:nil];

//                for (NSInteger i =0; i<100; i++) {
//                    [SHProgressHUD updateSingleProgress:i];
//                    sleep(1);
//                }
//                 [SHProgressHUD hideHUD];
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                        // Do something useful in the background and update the HUD periodically.
//                         usleep(50000);
                        for (NSInteger i =0; i<100; i++) {
                            [SHProgressHUD updateSingleProgress:i];
                            usleep(50000);
                        }

                        dispatch_async(dispatch_get_main_queue(), ^{
                            [SHProgressHUD hideHUD];
                        });
                    });
//
               
                
                
                
            }
                break;
                
            default:
            {
                
                
                [SHProgressHUD showSingleWheelInView:self.view];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SHProgressHUD hideHUD];
                });
                
            }
                break;
        }
    
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
