//
//  YSHSearchCountryModel.h
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHCountryCodeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSHSearchCountryModel : NSObject
@property (nonatomic,copy) NSString * indexStr;

@property (nonatomic,strong) NSArray <YSHCountryCodeModel *>* dataArray;
@end

NS_ASSUME_NONNULL_END
