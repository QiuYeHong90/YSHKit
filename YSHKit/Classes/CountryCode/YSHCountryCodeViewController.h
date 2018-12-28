//
//  YSHCountryCodeViewController.h
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//
#import "YSHCountryCodeTool.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHCountryCodeViewController : UINavigationController
@property (nonatomic,copy) void(^CallBlock)(YSHCountryCodeModel * model);
/**
 搜索输入placehodler
 */
@property (nonatomic,copy) NSString * searchPlaceholder;
@end

NS_ASSUME_NONNULL_END
