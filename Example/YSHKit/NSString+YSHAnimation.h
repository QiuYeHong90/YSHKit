//
//  NSString+YSHAnimation.h
//  YSHKit_Example
//
//  Created by shuhui on 2019/1/30.
//  Copyright © 2019 793983383@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YSHAnimation)
- (void)animateOnView:(UIView *)aView atRect:(CGRect)aRect forFont:(UIFont *)aFont withColor:(UIColor *)aColor andDuration:(CGFloat)aDuration;
@end

NS_ASSUME_NONNULL_END
