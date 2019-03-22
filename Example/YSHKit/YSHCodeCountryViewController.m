//
//  YSHCodeCountryViewController.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import <YYKit/YYKit.h>
#import <SDWebImage/SDImageCache.h>
#import "YSHCodeCountryViewController.h"

@interface YSHCodeCountryViewController ()

@end

@implementation YSHCodeCountryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        [[SDImageCache sharedImageCache] clearMemory];
    }];
    
//    initLoad
    
    
    
    
    NSArray * dictArr = [[[YSHCountryCodeTool shareCountryCodeTool] countryCodeArray] modelToJSONObject];
    
    NSString *homeDir = NSHomeDirectory();
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"test.plist"];
    [dictArr writeToFile:filePath atomically:YES];
    

    
    
    
    
    
    
    
    [self saveRootDict];
    
    
    
//    [self.codeView setPhoneCode:@"86"];
    
    self.codeView.CallBlock = ^{
        
    };
}




-(void)saveRootDict
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    
    NSArray * keys = @[
                       @"code_vietnam",
                       @"code_china",
                       @"code_en",
                       
                       ].mutableCopy;
    
    
    NSMutableDictionary * rootDict = @{
                                       }.mutableCopy;
    
    for (NSString * key in keys) {
        NSString * path  = [[NSBundle mainBundle] pathForResource:key ofType:@"plist"];
        NSArray * dataArr1 = [NSArray arrayWithContentsOfURL:[NSURL fileURLWithPath:path]];
        
        [rootDict setValue:dataArr1 forKey:key];
        
       
        
    }
    
    
    NSString *filePath1 = [docDir stringByAppendingPathComponent:@"root.plist"];
    [rootDict writeToFile:filePath1 atomically:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
