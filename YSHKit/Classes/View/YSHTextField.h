//
//  YSHTextField.h
//  Pods-YSHKit_Example
//
//  Created by shuhui on 2018/12/17.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    YDTextFieldStyleUIDefault,
    YDTextFieldStyleUI1,
} YDTextFieldStyleUI;

NS_ASSUME_NONNULL_BEGIN

@interface YSHTextField : UITextField

/**
 是否有图片左边
 */
@property (nonatomic,assign) IBInspectable BOOL isNoLeftImage;
/**
 是否有右边图片
 */
@property (nonatomic,assign) IBInspectable BOOL isHaveRightImg;
@property (nonatomic,assign) IBInspectable NSInteger styleUI;

@property (nonatomic,strong) IBInspectable UIImage * leftImg;
@property (nonatomic,strong) IBInspectable UIImage * rightImg;



@end

NS_ASSUME_NONNULL_END
