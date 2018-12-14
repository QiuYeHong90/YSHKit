//
//  SHProgressHUD.m
//  HiBabyTeacher
//
//  Created by Mac on 2018/8/14.
//  Copyright © 2018年 袁书辉. All rights reserved.
//
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#import "YYKit.h"

#import "SHProgressHUD.h"
@interface SHProgressHUD()
@property (atomic, assign) BOOL canceled;
@end

@implementation SHProgressHUD

+(instancetype)shareManager{
    static SHProgressHUD *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SHProgressHUD alloc]init];
    });
    return manager;
}



#pragma mark - 风火轮/菊花
+(void)showSingleWheelInView:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 3*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}
#pragma mark - 简单的菊花加上简单的文字
+(void)showSingeWheelWithMsg:(NSString *)msg view:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = msg;
    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 3*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}
#pragma mark - 简单的菊花加上简单的文字和复杂的文字
+(void)showSingleWheelWithSingelMsg:(NSString *)msg detailMsg:(NSString *)detailMsg view:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = msg;
    hud.detailsLabel.text = detailMsg;
    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 3*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}
#pragma mark - 蛋糕状读条器
+(void)showSingleProgressView:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    [SHProgressHUD commonConfigHud:hud];
    NSProgress *progressObject = [NSProgress progressWithTotalUnitCount:100];
    hud.progressObject = progressObject;
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [[SHProgressHUD shareManager]doSomeWorkWithProgressObject:progressObject];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}
#pragma mark - 蛋糕状读条器带着取消按钮
-(void)showSingleProgressViewWithCancle:(UIView *)view singleMsg:(NSString *)msg buttonTitle:(NSString *)btnMsg{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Set the determinate mode to show task progress.
    hud.mode = MBProgressHUDModeDeterminate;
    [SHProgressHUD commonConfigHud:hud];
    hud.label.text = msg;
    // Configure the button.
    [hud.button setTitle:btnMsg forState:UIControlStateNormal];
    [hud.button addTarget:self action:@selector(cancelWork:) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [[SHProgressHUD shareManager] doSomeWorkWithProgress];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}
#pragma mark - 底部的msg
+(void)showSingleMsgInBottom:(NSString *)msg view:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    [SHProgressHUD commonConfigHud:hud];
    hud.label.text = msg;
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    [hud hideAnimated:YES afterDelay:3.f];
}
+(void)showSingleMsgInMiddle:(NSString *)msg view:(UIView *)view{
    if (view == nil) {
        view = kAppWindow;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    
    [SHProgressHUD commonConfigHud:hud];
    
    hud.label.text = msg;
    
    [hud hideAnimated:YES afterDelay:1.f];
}

#pragma mark - 自定义的一张view
+(void)showSingleCustonImageSetmsg:(NSString *)msg view:(UIView *)view imageName:(NSString *)imageName setSquare:(BOOL)square{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = square;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:3.f];
}
#pragma mark - 显示一个信息 一段时间内自动结束
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    
    
    if (view == nil) view = kAppWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success
{
    //    [self showSuccess:success toView:nil];
    [SHProgressHUD showSingleMsgInMiddle:success view:nil];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"php_success" view:view];
}

/**
 *  显示错误信息
 *
 */
+ (void)showError:(NSString *)error
{
    //    [self showError:error toView:nil];
    [SHProgressHUD showSingleMsgInMiddle:error view:nil];
    
    
}
/**
 *  显示错误信息
 *
 */
+ (void)showError:(NSString *)error afterDelay:(NSTimeInterval)delay
{
    UIView * view = nil;
    if (view == nil) {
        view = kAppWindow;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    [SHProgressHUD commonConfigHud:hud];
    hud.label.text = error;
    //    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    [hud hideAnimated:YES afterDelay:delay];
    
    
}



+ (void)showSingleError:(NSString *)error{
    [self show:error icon:@"" view:nil];
}
/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 *  @param view  需要显示信息的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"php_fail" view:view];
}

+ (void)showErrorKeWin:(NSString *)error{
    [self show:error icon:@"php_fail" view:nil];
}


/**
 *  显示错误信息
 *
 *  @param message 信息内容
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

/**
 *  显示一些信息
 *
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:view animated:YES];
}
-(void)cancelWork{
    self.canceled=YES;
}
- (void)doSomeWork {
    // Simulate by just waiting.
    sleep(3.);
}

- (void)doSomeWorkWithProgressObject:(NSProgress *)progressObject {
    // This just increases the progress indicator in a loop.
    while (progressObject.fractionCompleted < 1.0f) {
        if (progressObject.isCancelled) break;
        [progressObject becomeCurrentWithPendingUnitCount:1];
        [progressObject resignCurrent];
        usleep(50000);
    }
}

- (void)doSomeWorkWithProgress {
    // This just increases the progress indicator in a loop.
    self.canceled = NO;
    float progress = 0.0f;
    while (progress < 1.0f) {
        if (self.canceled) break;
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            // Instead we could have also passed a reference to the HUD
            // to the HUD to myProgressTask as a method parameter.
            [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow].progress = progress;
        });
        usleep(50000);
    }
}
- (void)cancelWork:(id)sender {
    self.canceled = YES;
}

#pragma mark - 隐藏
-(void)hidePHProgressView:(UIView *)view animated:(BOOL)animate{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:view animated:animate];
}

+(void)dismissHUDWithView:(UIView *)view
{
    [[SHProgressHUD shareManager] hidePHProgressView:view animated:NO];
}


+(void)commonConfigHud:(MBProgressHUD *)hud
{
    hud.margin = 15 ;
    hud.marginV = 10 ;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithHexString:@"6f6f6f"];
    hud.label.textColor = [UIColor colorWithHexString:@"ffffff"];
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.label.numberOfLines = 0 ;
}


@end
