//
//  YSHTableViewCell.h
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/18.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "DYPhotoContainerView.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet DYPhotoContainerView * dy_contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dy_contentView_h;

@end

NS_ASSUME_NONNULL_END
