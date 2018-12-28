//
//  YSHSearchCodeViewController.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#define ZL_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define ZL_IS_IPHONE_X (ZL_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)
#import "NSBundle+YSHKit.h"
#import <Masonry/Masonry.h>
#import "YSHCountryCodeViewController.h"
#import "YSHSearchCodeResultViewController.h"
#import "YSHSearchCodeViewController.h"

@interface YSHSearchCodeViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchBarDelegate>
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) YSHSearchCodeResultViewController *searchVC;
@end

@implementation YSHSearchCodeViewController

-(NSMutableArray *)tableArray
{
    if (!_tableArray) {
        _tableArray =  @[].mutableCopy;
    }
    return _tableArray;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,ZL_IS_IPHONE_X?88:64, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    }
    
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = self.navigationController.title ;
    [self initUI];
    [self initSearchController];
    [self loadData];
}
-(void)initUI
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(@(ZL_IS_IPHONE_X?88:64));
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;//不加的话，table会下移
    //    self.edgesForExtendedLayout = UIRectEdgeNone;//不加的话，UISearchBar返回后会上移
    
    UIImage * image =[NSBundle ysh_imageName:@"back"];
    UIImage * newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithImage:newImage style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
    self.navigationItem.leftBarButtonItem = rightButtonItem;
}


-(void)back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)initSearchController{
    
    self.searchVC = [YSHSearchCodeResultViewController new];
    //创建UISearchController
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.searchVC];
    self.searchController.searchResultsUpdater = self.searchVC;
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
    [self.searchController.searchBar sizeToFit];
    if (self.searchPlaceholder) {
        self.searchController.searchBar.placeholder = self.searchPlaceholder;
    }else{
        self.searchController.searchBar.placeholder = NSLocalizedString(@"search", nil);
    }
    
    
    //包着搜索框外层的颜色
    self.searchController.searchBar.tintColor = [UIColor colorWithRed:22.0/255 green:161.0/255 blue:1.0/255 alpha:1];
    self.searchController.searchBar.barTintColor = [UIColor groupTableViewBackgroundColor];
    self.searchController.searchBar.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.searchController.searchBar.layer.borderWidth = 0;
    //设置UISearchController的显示属性，以下3个属性默认为YES
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
    [self.searchController.searchBar setBackgroundImage:[UIImage new]];
    //搜索时，背景变暗色
    self.searchController.dimsBackgroundDuringPresentation = NO;
    //    self.searchController.obscuresBackgroundDuringPresentation = NO;
    //点击搜索的时候,是否隐藏导航栏
    self.searchController.hidesNavigationBarDuringPresentation = YES;
    
    //    iOS11之后searchController有了新样式，可以放在导航栏
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    //    if (@available(iOS 11.0, *)) {
    //        self.navigationItem.searchController = self.searchController;
    //    } else {
    //        self.tableView.tableHeaderView = self.searchController.searchBar;
    //    }
    
#warning 如果进入预编辑状态,searchBar消失(UISearchController套到TabBarController可能会出现这个情况),请添加下边这句话
    self.definesPresentationContext = YES;
    self.searchVC.nav = self.navigationController;
    self.searchVC.searchBar = self.searchController.searchBar;
    
    
}

-(void)loadData
{
    NSArray * dataArr = [YSHCountryCodeTool shareCountryCodeTool].countryCodeArray;
    
    
    
    [self.dataArray setArray:dataArr];
    [self.tableArray setArray:[YSHCountryCodeTool getTableArray:dataArr]];
    
    NSMutableArray * temp = @[].mutableCopy;
    for (YSHSearchCountryModel * model in self.tableArray) {
        [temp addObject:model.indexStr];
    }
    self.indexArray = temp;
    
    [self.tableView reloadData];
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    YSHSearchCountryModel * model  =  self.tableArray[section];
    return model.dataArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DYCountrySearchCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"DYCountrySearchCell"];
    }
    YSHSearchCountryModel * model = self.tableArray[indexPath.section];
    YSHCountryCodeModel * rowModel  = model.dataArray[indexPath.row];
    cell.textLabel.text = rowModel.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"+%@",rowModel.dial_code];
    
    return cell;
}



//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UITableViewHeaderFooterView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DYCountryHeaderView"];
//
//    if (!view) {
//        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"DYCountryHeaderView"];
//    }
//    DYSearchModel * model = self.tableArray[section];
//    view.textLabel.text = model.indexStr;
//    return view;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    YSHSearchCountryModel * model = self.tableArray[section];
    //    view.textLabel.text = model.indexStr;
    
    return model.indexStr;
}



- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    return self.indexArray;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSHSearchCountryModel * model = self.tableArray[indexPath.section];
    YSHCountryCodeModel * rowModel  = model.dataArray[indexPath.row];
    
    YSHCountryCodeViewController * nav = (YSHCountryCodeViewController *)self.navigationController;
    if (nav.CallBlock) {
        nav.CallBlock(rowModel);
    }
    [nav dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    
    
    
    [searchBar setShowsCancelButton:YES animated:YES];
    for (id obj in [searchBar subviews]) {
        if ([obj isKindOfClass:[UIView class]]) {
            for (id obj2 in [obj subviews]) {
                if ([obj2 isKindOfClass:[UIButton class]]) {
                    UIButton *btn = (UIButton *)obj2;
                    [btn setTitle:NSLocalizedString(@"取消", nil) forState:UIControlStateNormal];
                }
            }
        }
    }
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //    SearchDetailVC *vc = [[SearchDetailVC alloc]initWithNibName:@"SearchDetailVC" bundle:nil];
    //    [self.navigationController pushViewController:vc animated:YES];
    //    self.searchController.active = NO;
    
    
}

#pragma mark - UISearchControllerDelegate代理
//测试UISearchController的执行过程
- (void)willPresentSearchController:(UISearchController *)searchController {
    NSLog(@"willPresentSearchController");
    
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    NSLog(@"didPresentSearchController");
    self.searchVC.dataListArry = self.dataArray;
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    NSLog(@"willDismissSearchController");
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    NSLog(@"didDismissSearchController");
    
}

- (void)presentSearchController:(UISearchController *)searchController {
    NSLog(@"presentSearchController");
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
