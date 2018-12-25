//
//  YSHSearchCodeViewController.h
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHCountryCodeTool.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHSearchCodeViewController : UIViewController
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataArray;

@property (nonatomic,strong) NSMutableArray * tableArray;

@property (nonatomic,strong) NSArray * indexArray;
@end

NS_ASSUME_NONNULL_END
