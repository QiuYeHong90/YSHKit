//
//  YSHSearchCountryCodeModel.h
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHCountryCodeModel : NSObject
/**
 国家代号
 */
@property (nonatomic,copy) NSString * code;

/**
 国家名称
 */
@property (nonatomic,copy) NSString * name;

/**
 手机区号
 */
@property (nonatomic,strong) NSNumber * dial_code;

/**
 国家名称拉丁文
 */
@property (nonatomic, strong) NSString *latin;

@property (nonatomic,copy) NSString * phone;
@end

NS_ASSUME_NONNULL_END
