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




// 多语言
//当前加载的bundle
@property (strong, nonatomic) NSBundle *languageBunle;
// 根据key获取相应的String
- (NSString *) getStringForKey:(NSString *) key;
// 应用内设置新语言
- (void) setNewLanguage:(NSString *) language;
/**
 当前的系统语言
 */
@property (nonatomic,copy) NSString * currentLanguage;
/**
 app是否支持此种语言
 
 @return 所支持的语言
 */
+(NSString *)isSuport:(NSString *)string;
/**
 接口参数
 */
+(NSString *)interfaceLanguageString;

/**
 
 {
 @"code_en":@[
 @{
 @code = ZW;
 @"dial_code" = 263;
 @latin = Zimbabwe;
 name = Zimbabwe;
 }
 ],
 @"code_china":@[],
 @"code_vietnam":@[]
 
 }
 自定义国家代码
 */
-(void)initLoad:(NSDictionary *)codeRoot;

/**
 加载系统
 */
+(void)initLoadData;
@end

NS_ASSUME_NONNULL_END
