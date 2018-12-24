//
//  YSHTextField.m
//  Pods-YSHKit_Example
//
//  Created by shuhui on 2018/12/17.
//

#import "NSBundle+YSHKit.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
#import "YSHTextField.h"

@interface YSHTextFieldItemView : UIView
/**
 左边的图标 输入框
 */
@property (strong, nonatomic)  UIImageView *imageView;

@property (nonatomic,copy) void (^CallBlock)(void);
@end
@implementation YSHTextFieldItemView


- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.imageView];
        __weak typeof(self) weakSelf = self ;
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakSelf);
        }];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            if (weakSelf.CallBlock) {
                weakSelf.CallBlock();
            }
        }]];
    }
    return self;
}


@end


@interface YSHTextField ()
@property (nonatomic,strong) YSHTextFieldItemView * leftView1;
@property (nonatomic,strong) YSHTextFieldItemView * rightView1;
@end

@implementation YSHTextField
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [self initUI];
        
        YSHTextFieldItemView * leftView = [YSHTextFieldItemView new];
        
        
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.leftView =leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView1 = leftView;
        {
            YSHTextFieldItemView * rightView = [YSHTextFieldItemView new];
            rightView.hidden = NO;
            self.rightView =rightView;
            self.rightViewMode = UITextFieldViewModeAlways;
            self.rightView1 = rightView;
            self.rightView.width = 5;
        }
        
        
        
        
        
        self.text = NSLocalizedString(self.text, nil);
        
        
        
        if (self.secureTextEntry == YES) {
            
            //            说明是密码 需要加眼睛
            self.isHaveRightImg = YES;
            [self paswordOpenEyes];
            __weak typeof(self) weakSelf = self;
            self.rightView1.CallBlock = ^{
                weakSelf.secureTextEntry = !weakSelf.secureTextEntry;
                [weakSelf paswordOpenEyes];
            };
        }else{
            self.isHaveRightImg = NO;
        }
        
        
        
    }
    return self;
}
-(void)setStyleUI:(NSInteger)styleUI
{
    _styleUI = styleUI ;
    
    
    
    [self updateStyle];
}

-(void)initUI
{
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithHexString:@"e6e6e6"].CGColor;
    self.borderStyle = UITextBorderStyleNone;
    
    
}



-(void)paswordOpenEyes
{
    if (self.secureTextEntry) {
        
        self.rightImg = [NSBundle ysh_imageName:@"biyan"];
    }else{
        self.rightImg = [NSBundle ysh_imageName:@"zhengyan"];
    }
}

-(void)setIsNoLeftImage:(BOOL)isNoLeftImage
{
    _isNoLeftImage = isNoLeftImage;
    [self updateStyle];
}

-(void)setIsHaveRightImg:(BOOL)isHaveRightImg
{
    _isHaveRightImg = isHaveRightImg;
    
    [self updateStyle];
}



-(void)updateStyle
{
    //    风格
    switch (self.styleUI) {
            case YDTextFieldStyleUIDefault:
        {
            self.layer.borderWidth = 1;
            self.layer.borderColor = [UIColor colorWithHexString:@"e6e6e6"].CGColor;
            self.borderStyle = UITextBorderStyleNone;
        }
            break;
            case YDTextFieldStyleUI1:
        {
            
            
            self.layer.borderWidth = 0;
            
            self.borderStyle = UITextBorderStyleNone;
            
            UIView * view= [UIView new];
            view.backgroundColor  = [UIColor colorWithHexString:@"e6e6e6"];
            [self addSubview:view];
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@1);
                make.bottom.equalTo(@1);
                make.left.right.equalTo(@0);
            }];
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    //    左边图片
    if (self.isNoLeftImage==YES) {
        
        if (self.styleUI == 1 ) {
            self.leftView.width = 0;
            self.leftView1.imageView.hidden = YES;
        }else{
            self.leftView.width = 15;
            self.leftView1.imageView.hidden = YES;
        }
        
        
        
    }else{
        self.leftView.width = 25;
        self.leftView1.imageView.hidden = NO;
    }
    
    
    //    右边的图片
    if (self.isHaveRightImg==YES) {
        
        self.rightView.width = 25;
        self.rightView1.imageView.hidden = NO;
        
    }else{
        self.rightView.width = 5;
        self.rightView1.imageView.hidden = YES;
    }
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self updateStyle];
}

-(void)setLeftImg:(UIImage *)leftImg
{
    _leftImg = leftImg;
    
    self.leftView1.imageView.image = leftImg;
    
}

- (void)setRightImg:(UIImage *)rightImg
{
    _rightImg = rightImg;
    
    self.rightView1.imageView.image = rightImg;
}

@end
