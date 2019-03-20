//
//  YSHCodeCountryInputView.h
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHCountryCodeTool.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface YSHCodeCountryInputView : UIView

/**
 顶部视图
 */
@property (nonatomic,strong) UIView * topView;

/**
 底部视图
 */
@property (nonatomic,strong) UIView * bottomView;

/**
 标题
 */
@property (nonatomic,strong) UILabel * ysh_titleLab;

/**
 区域lab
 */
@property (nonatomic,strong) UILabel * ysh_areaLab;

/**
 右边的图片
 */
@property (nonatomic,strong) UIImageView * ysh_rightView;

/**
 code
 */
@property (nonatomic,strong) UILabel * ysh_codeLab;
/**
 区域lab
 */
@property (nonatomic,strong) UITextField * ysh_phoneTextField;
/**
 区域lab
 */
@property (nonatomic,strong) UIImageView * ysh_phoneImgView;


/**
 线条颜色 默认clearColor
 */
@property (nonatomic,strong) IBInspectable UIColor * lineColor;
/**
 线条颜色 默认e6e6e6
 */
@property (nonatomic,strong) IBInspectable UIImage * rightRowImg;

/**
 搜索输入placehodler
 */
@property (nonatomic,copy) NSString * searchPlaceholder;
/**
 选择回调
 */
@property (nonatomic,copy) void (^CallBlock)(void);





/**
 是否满足条件
 @return YES/NO
 */
-(BOOL)isConfirm;
-(NSString *)getFillPhone;


/**
 赋值 初始值
 
 @param phone 手机号
 */
-(void)setFillPhoe:(NSString *)phone;

/**
 设置区号
 */
-(void)setPhoneCode:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
