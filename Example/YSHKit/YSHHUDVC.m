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
                                   @"title":@"加载load",
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
                
                
            default:
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                // Set the bar determinate mode to show task progress.
                hud.mode = MBProgressHUDModeIndeterminate;
//                [SHProgressHUD commonConfigHud:hud];
//                hud.label.text = NSLocalizedString(@"视频保存中", nil);
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
