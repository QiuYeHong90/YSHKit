//
//  YSHHudCustomView.m
//  YSHKit_Example
//
//  Created by shuhui on 2019/1/30.
//  Copyright © 2019 793983383@qq.com. All rights reserved.
//
#import "NSString+YSHAnimation.h"
#import "YSHHudCustomView.h"

@implementation YSHHudCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

    
-(void)layoutSubviews
    {
        [super layoutSubviews];
         [@"我是小灰灰" animateOnView:self atRect:CGRectMake(0, 0, 105, 39) forFont:[UIFont systemFontOfSize:17] withColor:UIColor.redColor andDuration:5];
       
    }
    

    
    
@end
