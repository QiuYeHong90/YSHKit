//
//  UIView+YSHTool.m
//  YSHKit_Example
//
//  Created by shuhui on 2019/3/26.
//  Copyright © 2019 793983383@qq.com. All rights reserved.
//

#import "UIView+YSHTool.h"

@implementation UIView (YSHTool)
-(void)exceYsh_layoutSubviews
{
    
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES ;
    self.clipsToBounds = NO ;
    
    self.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    self.layer.shadowOffset = CGSizeMake(1, 1);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 7;
    
}
@end
