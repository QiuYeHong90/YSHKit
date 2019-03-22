//
//  YSHSearchCountryCodeModel.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHCountryCodeModel.h"

@implementation YSHCountryCodeModel
-(NSString *)searchString
{
    return   [NSString stringWithFormat:@"%@%@",self.name,self.dial_code ];
}

@end
