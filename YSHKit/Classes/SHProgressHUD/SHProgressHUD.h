//
//  SHProgressHUD.h
//  HiBabyTeacher
//
//  Created by Mac on 2018/8/14.
//  Copyright © 2018年 袁书辉. All rights reserved.
//


#import "MBProgressHUD.h"
#import <Foundation/Foundation.h>

@interface SHProgressHUD : NSObject
+(instancetype)shareManager;
//风火轮/菊花
+(void)showSingleWheelInView:(UIView *)view;
//简单的菊花加上简单的文字
+(void)showSingeWheelWithMsg:(NSString *)msg view:(UIView *)view;
// 简单的菊花加上简单的文字和复杂的文字
+(void)showSingleWheelWithSingelMsg:(NSString *)msg detailMsg:(NSString *)detailMsg view:(UIView *)view;
// 蛋糕状读条器
+(void)showSingleProgressView:(UIView *)view;
//暂未使用
+(void)showSingleProgressViewWithCancle:(UIView *)view;
// 蛋糕状读条器带着取消按钮
-(void)showSingleProgressViewWithCancle:(UIView *)view singleMsg:(NSString *)msg buttonTitle:(NSString *)btnMsg;
// 底部的msg
+(void)showSingleMsgInBottom:(NSString *)msg view:(UIView *)view;
+(void)showSingleMsgInMiddle:(NSString *)msg view:(UIView *)view;
//自定义的一张view
+(void)showSingleCustonImageSetmsg:(NSString *)msg view:(UIView *)view imageName:(NSString *)imageName setSquare:(BOOL)square;
//显示成功的内容
+ (void)showSuccess:(NSString *)success;
//显示失败的内容 有图片
+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error afterDelay:(NSTimeInterval)delay;
///无图片
+ (void)showSingleError:(NSString *)error;

+(void)dismissHUDWithView:(UIView *)view;


/**
 展示错误在kewindow
 
 @param error 错误信息
 */
+ (void)showErrorKeWin:(NSString *)error;

/**
 配置hud

 @param hud 样式hud
 */
+(void)commonConfigHud:(MBProgressHUD *)hud;
@end
