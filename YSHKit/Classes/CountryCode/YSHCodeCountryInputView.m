//
//  YSHCodeCountryInputView.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "NSBundle+YSHKit.h"
#import "YSHCountryCodeViewController.h"

#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
#import "YSHCodeCountryInputView.h"

@interface YSHCodeCountryInputView ()







@end


@implementation YSHCodeCountryInputView
@synthesize lineColor = _lineColor;


//---------懒加载

- (UIColor *)lineColor
{
    if (!_lineColor) {
        _lineColor = [UIColor colorWithHexString:@"e6e6e6"];
    }
    return _lineColor ;
}


-(void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

-(void)setRightRowImg:(UIImage *)rightRowImg
{
    _rightRowImg = rightRowImg;
    [self setNeedsDisplay];
}



- (UILabel *)ysh_titleLab
{
    if (!_ysh_titleLab) {
        UILabel * tempLab = [UILabel new];
        tempLab.font = [UIFont systemFontOfSize:15];
        tempLab.textColor = [UIColor colorWithHexString:@"333333"];
        _ysh_titleLab = tempLab ;
        [self.topView addSubview:_ysh_titleLab];
    }
    return _ysh_titleLab;
}
-(UILabel *)ysh_areaLab
{
    if (!_ysh_areaLab) {
        UILabel * tempLab = [UILabel new];
        tempLab.font = [UIFont systemFontOfSize:15];
        tempLab.textColor = [UIColor colorWithHexString:@"333333"];
        _ysh_areaLab = tempLab ;
        [self.topView addSubview:_ysh_areaLab];
    }
    return _ysh_areaLab ;
}
- (UIImageView *)ysh_rightView
{
    if (!_ysh_rightView) {
        _ysh_rightView = [UIImageView new];
        
        _ysh_rightView.image = [NSBundle ysh_imageName:@"right_row"];
        [self.topView addSubview:_ysh_rightView];
    }
    return _ysh_rightView ;
}

-(UIView *)topView
{
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor whiteColor];
        
        _topView.layer.borderWidth = 0.5 ;
        _topView.layer.cornerRadius = 5 ;
        __weak typeof(self) weakSelf = self;
        [_topView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            YSHCountryCodeViewController * new = [YSHCountryCodeViewController new];
            new.searchPlaceholder = weakSelf.searchPlaceholder;
            new.title = weakSelf.ysh_titleLab.text ;
            new.CallBlock = ^(YSHCountryCodeModel *model) {
                weakSelf.ysh_areaLab.text = model.name;
                weakSelf.ysh_codeTextField.text = [NSString stringWithFormat:@"%@",model.dial_code];
            };
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:new animated:YES completion:nil];
        }]];
        [self addSubview:_topView];
    }
    return _topView;
}
- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
        _bottomView.layer.borderWidth = 0.5 ;
        _bottomView.layer.cornerRadius = 5 ;
        [self addSubview:_bottomView];
        
        UILabel * tempLab = [UILabel new];
        tempLab.font = [UIFont systemFontOfSize:15];
        tempLab.textColor = [UIColor colorWithHexString:@"333333"];
        tempLab.text = @"+";
        [_bottomView addSubview:tempLab];
        [tempLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.centerY.equalTo(_bottomView);
        }];
        
        
    }
    return _bottomView;
}

-(UITextField *)ysh_codeTextField
{
    if (!_ysh_codeTextField) {
        UITextField * tempLab = [UITextField new];
        tempLab.font = [UIFont systemFontOfSize:15];
        tempLab.textColor = [UIColor colorWithHexString:@"333333"];
        tempLab.keyboardType = UIKeyboardTypeNumberPad;
        
        _ysh_codeTextField = tempLab ;
        [tempLab addTarget:self action:@selector(codeChange:) forControlEvents:UIControlEventEditingChanged];
        [self.bottomView addSubview:_ysh_codeTextField];
    }
    return _ysh_codeTextField;
}
-(UITextField *)ysh_phoneTextField
{
    if (!_ysh_phoneTextField) {
        UITextField * tempLab = [UITextField new];
        tempLab.font = [UIFont systemFontOfSize:15];
        tempLab.textColor = [UIColor colorWithHexString:@"333333"];
        tempLab.clearButtonMode =  UITextFieldViewModeWhileEditing ;
        tempLab.keyboardType = UIKeyboardTypeNumberPad;
        
        _ysh_phoneTextField = tempLab ;
        [tempLab addTarget:self action:@selector(codeChange:) forControlEvents:UIControlEventEditingChanged];
        [self.bottomView addSubview:_ysh_phoneTextField];
    }
    return _ysh_phoneTextField;
}

-(UIView *)bottom_lineView
{
    if (!_bottom_lineView) {
        _bottom_lineView = [UIView new];
        _bottom_lineView.backgroundColor = [UIColor colorWithHexString:@"f7f7f7"];
        [self.bottomView addSubview:_bottom_lineView];
    }
    return _bottom_lineView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
        [self ysh_initUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
        [self ysh_initUI];
    }
    return self;
}


-(void)ysh_initUI
{
    __weak typeof(self) weakSelf = self;
    
    self.backgroundColor = [UIColor whiteColor];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom).offset(15);
        make.left.bottom.right.equalTo(@0);
        make.height.equalTo(weakSelf.topView.mas_height);
        
    }];
    
    
    [self.ysh_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(weakSelf.topView);
        make.width.equalTo(@70);
    }];
    
    [self.ysh_areaLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.ysh_titleLab.mas_right).offset(15);
        make.centerY.equalTo(weakSelf.topView);
        
        
    }];
    self.ysh_rightView.backgroundColor = UIColor.whiteColor;
    if (self.rightRowImg) {
        self.ysh_rightView.image = self.rightRowImg;
    }
    [self.ysh_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.ysh_rightView.image.size.width));
        make.height.equalTo(@(self.ysh_rightView.image.size.height));
        make.left.equalTo(weakSelf.ysh_areaLab.mas_right).offset(15);
        make.right.equalTo(@-15);
        make.centerY.equalTo(weakSelf.topView);
        
    }];
    //    bottomView 子控件
    
    [self.ysh_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.width.equalTo(@60);
        //        make.height.equalTo(@30);
        make.centerY.equalTo(weakSelf.bottomView);
    }];
    
    [self.bottom_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.ysh_codeTextField.mas_right).offset(5);
        make.top.bottom.equalTo(@0);
        make.width.equalTo(@1);
    }];
    
    
    [self.ysh_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bottom_lineView.mas_right).offset(5);
        make.right.equalTo(@-5);
        make.centerY.equalTo(weakSelf.bottomView);
        
    }];
    
    //    颜色
    {
        _topView.layer.borderColor = self.lineColor.CGColor;
        self.bottomView.layer.borderColor = self.lineColor.CGColor;
        self.bottom_lineView.backgroundColor = self.lineColor ;
    }
}

-(void)initUI
{
    
    YSHCountryCodeModel * model = [YSHCountryCodeTool shareCountryCodeTool].curretnCountryModel;
    self.ysh_codeTextField.text =  [NSString stringWithFormat:@"%@",model.dial_code];
    self.ysh_areaLab.text = model.name;
    [self UIConfig];
    
    
}


-(void)UIConfig
{
    self.ysh_titleLab.text =  NSLocalizedString(@"国家/地区", nil);
    self.ysh_phoneTextField.placeholder = NSLocalizedString(@"输入联系方式", nil);
    self.searchPlaceholder = NSLocalizedString(@"搜索", nil);
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self ysh_initUI];
}

//-----------------点击事件
- (void)codeChange:(UITextField *)sender {
    
    if (sender == self.ysh_codeTextField) {
        NSString * text = sender.text;
        
        YSHCountryCodeModel * model  = [self getDefaultCountry:text];
        if (model) {
            self.ysh_areaLab.text = model.name;
        }else{
            self.ysh_areaLab.text = NSLocalizedString(@"", nil);
        }
        
        if (self.CallBlock) {
            self.CallBlock();
        }
    }
    
    if (sender == self.ysh_phoneTextField) {
        if (self.CallBlock) {
            self.CallBlock();
        }
    }
    
    
}
-(YSHCountryCodeModel * )getDefaultCountry:(NSString *)code
{
    NSPredicate * pred= [NSPredicate predicateWithFormat:@"dial_code = %@",code];
    
    NSArray * dataArr = [[YSHCountryCodeTool shareCountryCodeTool].countryCodeArray filteredArrayUsingPredicate:pred];
    
    if (dataArr&&dataArr.count>0) {
        YSHCountryCodeModel * model = [dataArr lastObject];
        return  model;
    }else{
        return nil;
    }
    
    
}

-(NSString *)getFillPhone
{
    return [NSString stringWithFormat:@"+%@-%@",self.ysh_codeTextField.text,self.ysh_phoneTextField.text];
}
-(void)setFillPhoe:(NSString *)phone
{
    
    YSHCountryCodeModel * deftModel  = [self fullPhoneNumberChange:phone];
    if (deftModel) {
        self.ysh_areaLab.text = deftModel.name;
        self.ysh_codeTextField.text = [NSString stringWithFormat:@"%@",deftModel.code];
        self.ysh_phoneTextField.text = [NSString stringWithFormat:@"%@",deftModel.phone];
    }else{
        self.ysh_areaLab.text = NSLocalizedString(@"", nil);
        self.ysh_codeTextField.text = nil;
        self.ysh_phoneTextField.text = nil;
    }
    
    
}

-(YSHCountryCodeModel *)fullPhoneNumberChange:(NSString *)phone
{
    if ([phone hasPrefix:@"+"]) {
        
        
        NSArray * tempArr = [phone componentsSeparatedByString:@"-"];
        if (tempArr.count==2) {
            
            NSString * phoneNum = tempArr.lastObject;
            
            NSString * presArea = [tempArr.firstObject stringByReplacingOccurrencesOfString:@"+" withString:@""];
            YSHCountryCodeModel * model  = [self getDefaultCountry:presArea];
            if (!model) {
                model = [YSHCountryCodeModel new];
            }
            
            
            model.phone = phoneNum;
            model.code = presArea;
            
            return model;
            
        }
        
    }
    
    return nil;
}

-(BOOL)isConfirm
{
    return self.ysh_codeTextField.text.length>0&&self.ysh_phoneTextField.text.length>0&&self.ysh_phoneTextField.text.length<=11;
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
