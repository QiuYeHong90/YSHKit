//
//  YSHCountryCodeTool.h
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHSearchCountryModel.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHCountryCodeTool : NSObject
@property (nonatomic,strong) NSArray * tempArray;
@property (nonatomic,strong) NSArray * countryCodeArray;

/**
 当前国家
 */
@property (nonatomic,strong) YSHCountryCodeModel * curretnCountryModel;

+ (instancetype)shareCountryCodeTool;
/**
 获取数组
 */
+(NSArray<YSHCountryCodeModel *> *)getCodeArray;
//接下来 我们把获取过的数据根据’A’-‘Z’进行归类
+(NSDictionary *)searchClassified:(NSArray *)dataArray;
+(NSArray <YSHSearchCountryModel *>*)getTableArray:(NSArray *)dataArray;
@end

NS_ASSUME_NONNULL_END
