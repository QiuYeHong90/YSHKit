//
//  YSHTableViewCell.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/18.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHTableViewCell.h"

@implementation YSHTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.dy_contentView.maxNum = 99 ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
