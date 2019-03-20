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

@interface YSHCodeCountryInputView ()<UITextFieldDelegate>







@end


@implementation YSHCodeCountryInputView
@synthesize lineColor = _lineColor;


//---------懒加载

- (UIColor *)lineColor
{
    if (!_lineColor) {
        _lineColor = [UIColor clearColor];
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

- (UIImageView *)ysh_phoneImgView
{
    if (!_ysh_phoneImgView) {
        _ysh_phoneImgView = [UIImageView new];
        
        _ysh_phoneImgView.image = [NSBundle ysh_imageName:@"denglu_shouji"];
        [self.bottomView addSubview:_ysh_phoneImgView];
    }
    return _ysh_phoneImgView ;
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
                weakSelf.ysh_codeLab.text = [NSString stringWithFormat:@"%@",model.dial_code];
            };
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:new animated:YES completion:nil];
        }]];
        
        UIView * line = [UIView new];
        line.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        [_topView addSubview:line];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(@.5);
        }];
        
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
        
        UIView * line = [UIView new];
        line.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        [_bottomView addSubview:line];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(@.5);
        }];
        
        
    }
    return _bottomView;
}

-(UILabel *)ysh_codeLab
{
    if (!_ysh_codeLab) {
        UILabel * tempLab = [UILabel new];
        tempLab.font = [UIFont systemFontOfSize:15];
        tempLab.textColor = [UIColor colorWithHexString:@"333333"];
        tempLab.textAlignment = NSTextAlignmentRight;
        _ysh_codeLab = tempLab ;
        [self.topView addSubview:_ysh_codeLab];
    }
    return _ysh_codeLab;
}
-(UITextField *)ysh_phoneTextField
{
    if (!_ysh_phoneTextField) {
        UITextField * tempLab = [UITextField new];
        tempLab.font = [UIFont systemFontOfSize:15];
        tempLab.textColor = [UIColor colorWithHexString:@"333333"];
        tempLab.clearButtonMode =  UITextFieldViewModeWhileEditing ;
        tempLab.keyboardType = UIKeyboardTypeNumberPad;
        tempLab.delegate = self ;
        _ysh_phoneTextField = tempLab ;
        [tempLab addTarget:self action:@selector(codeChange:) forControlEvents:UIControlEventEditingChanged];
        [self.bottomView addSubview:_ysh_phoneTextField];
    }
    return _ysh_phoneTextField;
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
        make.left.equalTo(@2);
        make.centerY.equalTo(weakSelf.topView);
        make.width.equalTo(@70);
    }];
    

    
    
    
    
    self.ysh_rightView.backgroundColor = UIColor.whiteColor;
    if (self.rightRowImg) {
        self.ysh_rightView.image = self.rightRowImg;
    }
    [self.ysh_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.ysh_rightView.image.size.width));
        make.height.equalTo(@(self.ysh_rightView.image.size.height));
        make.right.equalTo(@-15);
        make.centerY.equalTo(weakSelf.topView);
        
    }];
    
    
    
    //    bottomView 子控件
    [self.ysh_codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-25);
        make.centerY.equalTo(weakSelf.topView);
    }];
    {
        UILabel * tempLab = [UILabel new];
        tempLab.font = [UIFont systemFontOfSize:15];
        tempLab.textColor = [UIColor colorWithHexString:@"333333"];
        tempLab.text = @"+";
        [_topView addSubview:tempLab];
        __weak typeof(self) weakSelf = self;
        [tempLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.ysh_codeLab.mas_left).offset(-5);
            make.centerY.equalTo(weakSelf.topView);
        }];
        
        
    }
    
    
    
    
    
    
    [self.ysh_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.right.equalTo(@-5);
        make.centerY.equalTo(weakSelf.bottomView);
        
    }];
    
    [self.ysh_phoneImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@2);
        make.centerY.equalTo(weakSelf.bottomView);
    }];
    
    
    //    颜色
    {
        _topView.layer.borderColor = self.lineColor.CGColor;
        self.bottomView.layer.borderColor = self.lineColor.CGColor;
        
    }
    
    
    self.ysh_areaLab.hidden = YES ;
    
}

-(void)initUI
{
    
    YSHCountryCodeModel * model = [YSHCountryCodeTool shareCountryCodeTool].curretnCountryModel;
    self.ysh_codeLab.text =  [NSString stringWithFormat:@"%@",model.dial_code];
    self.ysh_areaLab.text = model.name;
    [self UIConfig];
    
    
}


-(void)UIConfig
{
    self.ysh_titleLab.text =  NSLocalizedString(@"login_txt_telephone_code", @"国家/地区");
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
//    11
    
    
    if (sender == self.ysh_codeLab) {
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


-(void)setPhoneCode:(NSString *)code
{
    NSString * text = code;
    
    YSHCountryCodeModel * model  = [self getDefaultCountry:text];
    if (model) {
        self.ysh_areaLab.text = model.name;
    }else{
        self.ysh_areaLab.text = NSLocalizedString(@"", nil);
    }
    self.ysh_codeLab.text = code ;
    if (self.CallBlock) {
        self.CallBlock();
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    if (textField == self.ysh_phoneTextField) {
        
        
      return   !(range.location >= 11);
    }
    
    return YES;
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
    return [NSString stringWithFormat:@"+%@-%@",self.ysh_codeLab.text,self.ysh_phoneTextField.text];
}
-(void)setFillPhoe:(NSString *)phone
{
    
    YSHCountryCodeModel * deftModel  = [self fullPhoneNumberChange:phone];
    if (deftModel) {
        self.ysh_areaLab.text = deftModel.name;
        self.ysh_codeLab.text = [NSString stringWithFormat:@"%@",deftModel.code];
        self.ysh_phoneTextField.text = [NSString stringWithFormat:@"%@",deftModel.phone];
    }else{
        self.ysh_areaLab.text = NSLocalizedString(@"", nil);
        self.ysh_codeLab.text = nil;
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
    return self.ysh_codeLab.text.length>0&&self.ysh_phoneTextField.text.length>0&&self.ysh_phoneTextField.text.length<=11;
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
