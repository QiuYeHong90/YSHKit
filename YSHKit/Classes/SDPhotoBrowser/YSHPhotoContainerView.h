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


/**
 NSString * thumbnail = @"-thumbnail200";
 七牛后面拼接-thumbnail200 接口获取缩略图
 */
@property (nonatomic,copy) NSString * thumbnail ;

/**
 是否使用图片后面拼接获取缩略图 默认不使用
 */
@property (nonatomic,assign) BOOL isUseThumbnail;

@property (nonatomic,assign) BOOL isLoadImg;
/**
 点击跳转视频播放
 
 @param thumbImage 封面图
 */
-(void)tapVideo:(UIImage *)thumbImage;


- (void)setup;
@end

NS_ASSUME_NONNULL_END
