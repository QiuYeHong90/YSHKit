//
//  SDPhotoBrowserConfig.h
//  SDPhotoBrowser
//
//  Created by aier on 15-2-9.
//  Copyright (c) 2015年 GSD. All rights reserved.
//


typedef enum {
    SDWaitingViewModeLoopDiagram, // 环形
    SDWaitingViewModePieDiagram // 饼型
} SDWaitingViewMode;

// 图片保存成功提示文字 ip_tips_save_success    保存图片成功    Save the picture successfully    Lưu ảnh thành công

#define SDPhotoBrowserSaveImageSuccessText NSLocalizedString(@"保存图片成功", nil);

// 图片保存失败提示文字 ip_tips_save_fail    保存图片失败    Failed to save image    Lưu ảnh thất bại

#define SDPhotoBrowserSaveImageFailText NSLocalizedString(@"保存图片失败", nil);
// browser背景颜色
#define SDPhotoBrowserBackgrounColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.95]

// browser中图片间的margin
#define SDPhotoBrowserImageViewMargin 10

// browser中显示图片动画时长
#define SDPhotoBrowserShowImageAnimationDuration 0.4f

// browser中显示图片动画时长
#define SDPhotoBrowserHideImageAnimationDuration 0.4f

// 图片下载进度指示进度显示样式（SDWaitingViewModeLoopDiagram 环形，SDWaitingViewModePieDiagram 饼型）
#define SDWaitingViewProgressMode SDWaitingViewModeLoopDiagram

// 图片下载进度指示器背景色
#define SDWaitingViewBackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]

// 图片下载进度指示器内部控件间的间距
#define SDWaitingViewItemMargin 10

