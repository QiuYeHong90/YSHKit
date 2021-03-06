//
//  YSHPhotoContainerView.m
//  Masonry
//
//  Created by shuhui on 2018/12/18.
//
#define SCR_W [[UIScreen mainScreen] bounds].size.width
#define kCViewBgColor [UIColor colorWithHexString:@"f7f7f7"]


const NSInteger img_MaxNum = 9 ;

#import "NSBundle+YSHKit.h"
#import "SDPhotoBrowser.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SDImageCache.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
#import "YSHPhotoContainerView.h"
@interface YSHPhotoContainerView ()
<SDPhotoBrowserDelegate>

@property (nonatomic, strong) NSMutableArray *imageViewsArray;

@property (nonatomic,strong) UIImageView * playImgView;
@property (nonatomic,copy) void (^CallBlock)(CGFloat h,BOOL isReload);


@end
@implementation YSHPhotoContainerView

- (NSMutableArray *)imageViewsArray
{
    if (!_imageViewsArray) {
        _imageViewsArray = @[].mutableCopy;
    }
    return _imageViewsArray;
}


-(UIImageView *)playImgView
{
    
    if (!_playImgView) {
        _playImgView = [[UIImageView alloc] initWithImage:[NSBundle ysh_imageName:@"bofang"]];
        
    }
    return _playImgView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    
    self.isLoadImg = YES ;
    self.maxNum = img_MaxNum ;
    
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES ;
    
    self.thumbnail = @"-thumbScale";
    self.qiNiuBaseImgUrl = @"http://vn.cqdunyue.com";
}


-(void)setMaxNum:(NSInteger)maxNum
{
    
    if (maxNum<=0) {
        maxNum = 9 ;
    }
    
    _maxNum = maxNum ;
    //
    //    [self removeAllSubviews];
    //    NSMutableArray *temp = [NSMutableArray new];
    //
    //    for (int i = 0; i < _maxNum+1; i++) {
    //        UIImageView *imageView = [UIImageView new];
    //        [self addSubview:imageView];
    //        imageView.userInteractionEnabled = YES;
    //        imageView.clipsToBounds = YES;
    //        imageView.tag = i;
    //        imageView.backgroundColor = kCViewBgColor;
    //        imageView.contentMode = UIViewContentModeScaleAspectFill;
    //        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    //        [imageView addGestureRecognizer:tap];
    //        [temp addObject:imageView];
    //    }
    //
    //    self.imageViewsArray = [temp copy];
}


/**
 根据链接获取图片宽高 有规则图片 返回为0 则是无规则图片
 */
-(CGSize)ysh_getImgRateWH:(NSString *)imgUrl
{
    NSArray * tempArr = [imgUrl componentsSeparatedByString:@"/"];
    if (tempArr&&tempArr.count>0) {
        NSArray * w_hArray = [tempArr.lastObject componentsSeparatedByString:@"_"];
        if (w_hArray&&w_hArray.count==2) {
            CGFloat w  = [w_hArray.firstObject floatValue];
            CGFloat h  = [w_hArray.lastObject floatValue];
            if (h>0) {
                return CGSizeMake(w, h);
            }
        }
    }
    
    return CGSizeZero;
}


-(void)picPathStringsArray:(NSArray *)picPathStringsArray  callBlock:(void(^)(CGFloat h,BOOL isReload))callBlock
{
    
    if (picPathStringsArray.count==1) {
        if ([picPathStringsArray.firstObject isEqualToString:@""]) {
            callBlock(0,NO);
            return ;
        }
    }
    
    self.picPathStringsArray = picPathStringsArray;
    if (self.picPathStringsArray.count+1>self.imageViewsArray.count) {
        
        for (long i = self.imageViewsArray.count; i<self.picPathStringsArray.count+1; i++) {
            UIImageView *imageView = [UIImageView new];
            [self addSubview:imageView];
            imageView.userInteractionEnabled = YES;
            imageView.clipsToBounds = YES;
            imageView.tag = i;
            imageView.backgroundColor = kCViewBgColor;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
            [imageView addGestureRecognizer:tap];
            [self.imageViewsArray addObject:imageView];
        }
        
    }else{
        for (long i = _picPathStringsArray.count; i < self.imageViewsArray.count; i++) {
            @autoreleasepool {
                UIImageView *imageView = [self.imageViewsArray objectAtIndex:i];
                imageView.image = nil;
                imageView.hidden = YES;
            }
            
        }
    }
    
    
    
    
    //    没有图片
    
    if (_picPathStringsArray.count == 0||(_picPathStringsArray.count == 1&&[self isNullWithObj:_picPathStringsArray.firstObject])) {
        
        
        if (callBlock) {
            callBlock(0,NO);
        }
        
        return;
    }
    
    CGFloat itemW = [self itemWidthForPicPathArray:_picPathStringsArray];
    CGFloat itemH = 0;
    self.playImgView.hidden = !self.isVideo;
    //    有一张图片 做缓存
    if (_picPathStringsArray.count == 1) {
        
        
        NSString  *urlStr = picPathStringsArray.firstObject;
        
        if ([self isNullWithObj:urlStr]) {
            
            if (callBlock) {
                
                callBlock(0,NO);
            }
            return;
        }
        
        CGSize urlStrSize = [self ysh_getImgRateWH:urlStr] ;
        
        
        if (self.isUseThumbnail) {
           
            if ([picPathStringsArray.firstObject hasPrefix:self.qiNiuBaseImgUrl]) {
                urlStr = [NSString stringWithFormat:@"%@%@",picPathStringsArray.firstObject,self.thumbnail];
            }
            
        }
        UIImageView *imageView = [_imageViewsArray firstObject];
        
        if (self.playImgView.superview == nil) {
            
            [imageView addSubview:self.playImgView];
            //        35 45
            [self.playImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(imageView);
                make.width.equalTo(@(35/2.f));
                make.height.equalTo(@(45/2.f));
            }];
        }
        
        
        
        
        //        判断缓存中是否有图片
        UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromCacheForKey:urlStr];
        
        if (!cachedImage) {
            
            if (urlStrSize.width!=0&&urlStrSize.height!=0) {
                
                //            默认宽高
                CGSize imgSize = [self oneImg:urlStrSize.height imgW:urlStrSize.width itemMaxW:itemW];
                imageView.frame = CGRectMake(0, 0, imgSize.width, imgSize.height);
                if (callBlock) {
                    
                    callBlock(imgSize.height,NO);
                }
                [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
                return ;
            }else{
                //            默认宽高
                CGFloat h = itemW*9.f/16;
                imageView.frame = CGRectMake(0, 0, itemW, h);
                if (callBlock) {
                    
                    callBlock(h,NO);
                }
            }
            
            
            
            
            
            
            
            //            开始加载图片
#if DEBUG
            NSLog(@"加载图片---%@",urlStr);
#endif
            
            [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                
                
                
                
                
                CGFloat h = 0 ;
                CGFloat itemW1 = itemW;
                if (image) {
                    
                    
                    CGSize imgSize = [self oneImg:image.size.height imgW:image.size.width itemMaxW:itemW];
                    itemW1 = imgSize.width;
                    h = imgSize.height;
                    
                    if (callBlock) {
                        
                        callBlock(h,cacheType == SDImageCacheTypeNone);
                    }
                    
                    imageView.frame = CGRectMake(0, 0, itemW1, h);
                    
                }
                
            }];
            
            
        }else{
            
            CGFloat h = 0 ;
            CGFloat itemW1 = itemW;
            CGSize imgSize = [self oneImg:cachedImage.size.height imgW:cachedImage.size.width itemMaxW:itemW];
            itemW1 = imgSize.width;
            h = imgSize.height;
            
            if (callBlock) {
                
                callBlock(h,NO);
            }
            imageView.image = cachedImage;
            imageView.frame = CGRectMake(0, 0, itemW1, h);
            
        }
        
        
        
        
        
        return ;
        
        
    } else {
        itemH = itemW;
    }
    
    self.CallBlock = callBlock ;
    
    
    [self updateMoreImgHight:NO];
    return;
    
    
}


-(void)updateMoreImgHight:(BOOL)isRead
{
    
    CGFloat itemW ,itemH;
    itemW = itemH = [self itemWidthForPicPathArray:_picPathStringsArray];
    long perRowItemCount = [self perRowItemCountForPicPathArray:_picPathStringsArray];
    CGFloat margin = 5;
    
    
    if (self.isOpen == NO) {
        BOOL flag = _picPathStringsArray.count>img_MaxNum ;
        NSInteger imgCount = flag?img_MaxNum:_picPathStringsArray.count ;
        for (NSInteger idx = 0; idx< imgCount; idx++) {
            NSString * obj = nil;
            long columnIndex = idx % perRowItemCount;
            long rowIndex = idx / perRowItemCount;
            UIImageView *imageView = [self.imageViewsArray objectAtIndex:idx];
            imageView.hidden = NO;
            imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
            [imageView removeAllSubviews];
            if (idx<_picPathStringsArray.count) {
                obj = _picPathStringsArray [idx];
                if (self.isUseThumbnail) {
                    if ([_picPathStringsArray [idx] hasPrefix:self.qiNiuBaseImgUrl]) {
                        obj = [NSString stringWithFormat:@"%@%@",_picPathStringsArray [idx],self.thumbnail];
                    }
                    
                }
                
                
                if (idx==8) {
                    [imageView removeAllSubviews];
                    if (flag) {
                        
                        
                        UIImageView * moreImgView = [UIImageView new];
                        if (self.moreImg) {
                            moreImgView.image = self.moreImg;
                        }else{
                            moreImgView.image = [NSBundle ysh_imageName:@"zhankaigengduo"];
                        }
                        moreImgView.contentMode = UIViewContentModeCenter;
                        moreImgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
                        [imageView addSubview:moreImgView];
                        [moreImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.left.right.bottom.top.equalTo(@0);
                        }];
                        
                        
                    }
                }
                if (obj) {
                    if (self.isLoadImg) {
                        
#if DEBUG
                        NSLog(@"加载图片---%@",obj);
#endif
                        [imageView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:nil];
                    }
                    
                }
            }
            
            
            
            
            
        }
        
    }else{
        
        BOOL flag = _picPathStringsArray.count>img_MaxNum ;
        NSInteger imgCount = _picPathStringsArray.count ;
        if (flag) {
            imgCount = _picPathStringsArray.count+1;
        }
        for (NSInteger idx = 0; idx< imgCount; idx++) {
            NSString * obj = nil;
            long columnIndex = idx % perRowItemCount;
            long rowIndex = idx / perRowItemCount;
            UIImageView *imageView = [self.imageViewsArray objectAtIndex:idx];
            imageView.hidden = NO;
            imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
            [imageView removeAllSubviews];
            if (idx<_picPathStringsArray.count) {
                obj = _picPathStringsArray [idx];
                if (self.isUseThumbnail) {
                    if ([_picPathStringsArray [idx] hasPrefix:self.qiNiuBaseImgUrl]) {
                        obj = [NSString stringWithFormat:@"%@%@",_picPathStringsArray [idx],self.thumbnail];
                    }
                   
                }
                
                
            }else{
                if (self.shouQiImg) {
                    imageView.image = self.shouQiImg ;
                }else{
                    imageView.image = [NSBundle ysh_imageName:@"shouqitupian"];
                }
                
            }
            
            if (obj) {
                if (self.isLoadImg) {
                    
#if DEBUG
                    NSLog(@"加载图片---%@",obj);
#endif
                    [imageView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:nil];
                }
                
            }
            
            
            
        }
    }
    
    
    
    
    NSInteger countItem ;
    if (self.isOpen) {
        countItem = _picPathStringsArray.count>img_MaxNum?_picPathStringsArray.count+1:_picPathStringsArray.count;
    }else{
        countItem = _picPathStringsArray.count>img_MaxNum?img_MaxNum:_picPathStringsArray.count;
    }
    
    
    int columnCount = ceilf(countItem * 1.0 / perRowItemCount);
    
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    
    
    if (self.CallBlock) {
        self.CallBlock(h,isRead);
    }
    
}




/**
 获取单张图片的高度和宽度
 
 @param imgH 图片宽度
 @param imgW 图片高度
 @param itemMaxW 最大宽度
 @return 大小
 */
-(CGSize)oneImg:(CGFloat)imgH imgW:(CGFloat)imgW itemMaxW:(CGFloat)itemMaxW
{
    //    CGFloat h1 = 0 ;
    //    CGFloat itemW1 = itemMaxW;
    //
    //
    //    CGFloat rate = imgH/imgW;
    //    h1 = itemW1*rate;
    //
    //
    //
    //    h1 = h1>200 ? 200:h1;
    //    itemW1 = h1/rate;
    //    return CGSizeMake(itemW1, h1);
    
    CGSize imgSize = [self KukungeVideoSizeWithImgW:imgW ImgH:imgH];
    
    return imgSize;
    
}


-(CGSize)KukungeVideoSizeWithImgW:(CGFloat)imgW  ImgH:(CGFloat)imgH
{
    
    CGFloat sW = SCR_W;
    CGFloat space = 8;
    NSInteger j = 3;
    CGFloat h = ((sW-15-10-5-15)-space*(j-1))/j;
    
    
    
    CGFloat maxW = (sW-30)*2/3.f;
    CGFloat maxH = h*2;
    
    //        220*460
    CGFloat minRate = 220/460.f;
    CGFloat maxRate = 460/220.f;
    CGFloat rate =  imgW/ imgH;
    if (rate>1) {
        rate = MIN(rate, maxRate);
        //            宽度比较宽限制宽度
        
        CGFloat coll_h = maxW/rate;
        
        
        
        return  CGSizeMake(maxW, coll_h);
        
        
    }else{
        rate = MAX(rate, minRate);
        
        CGFloat cell_w = rate*maxH;
        return  CGSizeMake(cell_w, maxH);
        
        
        
    }
}





-(void)tapVideo:(UIImage *)thumbImage
{
    
}

#pragma mark - private actions

- (void)tapImageView:(UITapGestureRecognizer *)tap
{
    
    if (self.isVideo) {
        UIImageView  *imageView = (UIImageView  *)tap.view;
        [self tapVideo:imageView.image];
        
    }else{
        
        
        UIView *imageView = tap.view;
        
        if (imageView.tag == 8) {
            if (!self.isOpen) {
                
                
                self.isOpen = YES ;
                if (self.CallBackIsOpenImgs) {
                    self.CallBackIsOpenImgs(self.isOpen);
                }
                return ;
            }
        }
        if (imageView.tag >= self.picPathStringsArray.count) {
            //            收起
            self.isOpen = NO ;
            if (self.CallBackIsOpenImgs) {
                self.CallBackIsOpenImgs(self.isOpen);
            }
            return ;
        }
        
        SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
        browser.currentImageIndex = imageView.tag;
        browser.sourceImagesContainerView = self;
        browser.imageCount = self.picPathStringsArray.count;
        browser.delegate = self;
        [browser show];
    }
    
}

- (CGFloat)itemWidthForPicPathArray:(NSArray *)array
{
    if (array.count == 1) {
        return SCR_W -60;
    } else {
        
        CGFloat space = 4;
        NSInteger n = 3;
        CGFloat w  = (SCR_W -60-(n-1)*space)/n;
        
        return w;
    }
}

- (NSInteger)perRowItemCountForPicPathArray:(NSArray *)array
{
    //    if (array.count < 3) {
    //        return array.count;
    //    } else if (array.count <= 4) {
    //        return 2;
    //    } else {
    //        return 3;
    //    }
    
    return 3;
}


#pragma mark - SDPhotoBrowserDelegate

- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *imageName = self.picPathStringsArray[index];
    NSURL *url = [NSURL URLWithString:imageName];
    return url;
}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = self.subviews[index];
    return imageView.image;
}


-(BOOL)isNullWithObj:(id)Obj
{
    if (Obj == nil||[Obj isEqual:[NSNull null]]) {
        return YES;
    }
    
    //     字符串类型
    if ([Obj isKindOfClass:[NSString class]]) {
        
        NSString *obj1 = (NSString *)Obj;
        obj1 = [obj1 stringByReplacingOccurrencesOfString:@" " withString:@""];
        if (obj1 == nil||[obj1 isEqualToString:@""]) {
            return YES;
        }
        
        return NO;
    }
    
    //    NSNumber 类型
    if ([Obj isKindOfClass:[NSNumber class]]) {
        
        NSNumber *obj1 = (NSNumber *)Obj;
        if (obj1 == nil||[obj1 isEqualToNumber:@0]) {
            return YES;
        }
        
        return NO;
    }
    
    //    NSArray
    if ([Obj isKindOfClass:[NSArray class]]) {
        
        NSArray *obj1 = (NSArray *)Obj;
        if (obj1 == nil||obj1.count==0) {
            return YES;
        }
        
        return NO;
    }
    //    NSDictionary
    if ([self isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *obj1 = (NSDictionary *)Obj;
        if ([obj1 isEqual:[NSNull null]]||obj1.count == 0) {
            return YES;
        }
        
        return NO;
    }
    
    
    
    return NO;
}

@end

