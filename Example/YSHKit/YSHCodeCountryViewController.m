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

-(void)saveAndrawDict
{
    
    
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
    
 
    {
        
        NSMutableArray *  rootArray ;
        NSMutableArray *  rootArray1 ;
        NSMutableArray *  rootArray2 ;
        
        NSMutableDictionary * rootDictsAll = @{
                                               
                                               @"AD":@{
                                                   @"countryName": @"Andorra",
                                                   @"chineseName": @"安道尔",
                                                   @"viName": @"Andorra",
                                                   @"mark": @"AD",
                                                   @"code": @"376"
                                                   }.mutableCopy,
                                               
                                               }.mutableCopy;
        
        {
            NSString * path  = [[NSBundle mainBundle] pathForResource:@"code_vietnam" ofType:@"plist"];
            rootArray = [NSArray arrayWithContentsOfURL:[NSURL fileURLWithPath:path]].mutableCopy;
            
            for (NSDictionary * item in rootArray) {
                //            {"code":"UY","latin":"Uruguay","name":"Uruguay","dial_code":"598"}
                
                if (rootDictsAll[item[@"code"]]) {
                    rootDictsAll[item[@"code"]][@"viName"] = item[@"name"];
                }else{
                    rootDictsAll[item[@"code"]] = @{
                                                    @"countryName": item[@"name"],
                                                    @"chineseName": item[@"name"],
                                                    @"viName": item[@"name"],
                                                    @"mark": item[@"code"],
                                                    @"code": item[@"dial_code"]
                                                    }.mutableCopy;
                }
                
                

                
                
            }
            
        }
        
        {
            NSString * path  = [[NSBundle mainBundle] pathForResource:@"code_china" ofType:@"plist"];
            rootArray1 = [NSArray arrayWithContentsOfURL:[NSURL fileURLWithPath:path]].mutableCopy;
            for (NSDictionary * item in rootArray1) {
                //            {"code":"UY","latin":"Uruguay","name":"Uruguay","dial_code":"598"}
                
                if (rootDictsAll[item[@"code"]]) {
                    rootDictsAll[item[@"code"]][@"chineseName"] = item[@"name"];
                }else{
                    rootDictsAll[item[@"code"]] = @{
                                                    @"countryName": item[@"name"],
                                                    @"chineseName": item[@"name"],
                                                    @"viName": item[@"name"],
                                                    @"mark": item[@"code"],
                                                    @"code": item[@"dial_code"]
                                                    }.mutableCopy;
                }
                
                
                
                
                
            }
        }
        {
            NSString * path  = [[NSBundle mainBundle] pathForResource:@"code_en" ofType:@"plist"];
            rootArray2 = [NSArray arrayWithContentsOfURL:[NSURL fileURLWithPath:path]].mutableCopy;
            for (NSDictionary * item in rootArray2) {
                //            {"code":"UY","latin":"Uruguay","name":"Uruguay","dial_code":"598"}
                
                if (rootDictsAll[item[@"code"]]) {
                    rootDictsAll[item[@"code"]][@"countryName"] = item[@"name"];
                }else{
                    rootDictsAll[item[@"code"]] = @{
                                                    @"countryName": item[@"name"],
                                                    @"chineseName": item[@"name"],
                                                    @"viName": item[@"name"],
                                                    @"mark": item[@"code"],
                                                    @"code": item[@"dial_code"]
                                                    }.mutableCopy;
                }
                
                
                
                
                
            }
        }
        
        NSLog(@"code_vietnammodelToJSONString----\n %@ \nmodelToJSONString----",[rootDictsAll.allValues modelToJSONString]);
        
        
    }
    
    
    
    
    for (NSString * key in keys) {
        
        NSString * path  = [[NSBundle mainBundle] pathForResource:key ofType:@"plist"];
        NSArray * dataArr1 = [NSArray arrayWithContentsOfURL:[NSURL fileURLWithPath:path]];
        
        [rootDict setValue:dataArr1 forKey:key];
        if ([key isEqualToString:@"code_vietnam"]) {
            
        }
       
        
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
