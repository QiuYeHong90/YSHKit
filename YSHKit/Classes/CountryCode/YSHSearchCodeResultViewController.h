//
//  YSHSearchCodeResultViewController.h
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHSearchCountryModel.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHSearchCodeResultViewController : UIViewController<UISearchResultsUpdating>
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray <YSHSearchCountryModel *>*dataListArry;
@end

NS_ASSUME_NONNULL_END
