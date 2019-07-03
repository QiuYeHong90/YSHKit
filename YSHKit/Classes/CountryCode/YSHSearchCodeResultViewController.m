//
//  YSHSearchCodeResultViewController.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "YSHCountryCodeViewController.h"
#import "YSHSearchCodeResultViewController.h"

@interface YSHSearchCodeResultViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)  UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *searchList;//满足搜索条件的数组
@end

@implementation YSHSearchCodeResultViewController

-(void)dealloc
{
    NSLog(@"释放--YSHSearchCodeResultViewController");
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];

        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.equalTo(@0);
        }];
    }

    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchList = [NSMutableArray new];
    self.dataListArry = [NSMutableArray new];

    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self ;
    self.automaticallyAdjustsScrollViewInsets = NO;//不加的话，table会下移
    self.edgesForExtendedLayout = UIRectEdgeNone;//不加的话，UISearchBar返回后会上移

    self.searchBar.searchBarStyle = UISearchBarStyleProminent;
    [ self.searchBar setBackgroundImage:[UIImage new]];

    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
}
#pragma mark - tableView
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.searchBar resignFirstResponder];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"YSHSearchCodeResult";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }

    YSHCountryCodeModel * model = self.searchList[indexPath.row];

    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"+%@",model.dial_code];
    //        cell.textLabel.textColor = [UIColor redColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    YSHCountryCodeModel * rowModel  = self.searchList[indexPath.row];

    YSHCountryCodeViewController * nav = (YSHCountryCodeViewController *)self.nav;
    if (nav.CallBlock) {
        nav.CallBlock(rowModel);
    }
    [nav dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UISearchResultsUpdating
//每输入一个字符都会执行一次
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{

    searchController.searchResultsController.view.hidden = NO;


    //谓词搜索 or dial_code == %@ searchString
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF.searchString CONTAINS %@",searchController.searchBar.text,searchController.searchBar.text];

    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }

    //过滤数据
    NSMutableArray * temp = [NSMutableArray arrayWithArray:[_dataListArry filteredArrayUsingPredicate:preicate]];

    self.searchList = temp;
    //刷新表格

    [self.tableView reloadData];
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
