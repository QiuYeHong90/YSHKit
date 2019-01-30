//
//  UIBezierPath+YSHTextPath.h
//  YSHKit_Example
//
//  Created by shuhui on 2019/1/30.
//  Copyright © 2019 793983383@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (YSHTextPath)
+ (UIBezierPath *)bezierPathWithText:(NSString *)text font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
