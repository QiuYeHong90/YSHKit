//
//  YSHPhotoContainerView.h
//  Masonry
//
//  Created by shuhui on 2018/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHPhotoContainerView : UIView
@property (nonatomic, strong) NSArray *picPathStringsArray;

/**
 是否是视频
 */
@property (nonatomic,assign) BOOL isVideo;

/**
 最大张数
 */
@property (nonatomic,assign) NSInteger maxNum;
/**
 视频地址视频
 */
@property (nonatomic,strong) NSURL * videoUrl;



-(void)picPathStringsArray:(NSArray *)picPathStringsArray callBlock:(void(^)(CGFloat h,BOOL isReload))callBlock;

/**
 是否是视频
 */
@property (nonatomic,assign) BOOL isOpen;

/**
 更多图片
 */
@property (nonatomic,strong) IBInspectable UIImage * moreImg;

/**
 收起的图片
 */
@property (nonatomic,strong) IBInspectable UIImage * shouQiImg;

@property (nonatomic,copy) void (^CallBackIsOpenImgs)(BOOL isOpen);
-(void)tapVideo:(UIImage *)thumbImage;
@end

NS_ASSUME_NONNULL_END
