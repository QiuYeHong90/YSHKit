//
//  NSBundle+YSHKit.m
//  Masonry
//
//  Created by shuhui on 2018/12/17.
//

#import "YSHTextField.h"
#import <YYKit/YYKit.h>
#import "YSHKit.h"
#import "NSBundle+YSHKit.h"

@implementation NSBundle (YSHKit)
+ (instancetype)ysh_kitBundle
{
    static NSBundle *refreshBundle = nil;
    if (refreshBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        NSBundle *mainBundle = [NSBundle bundleForClass:[YSHTextField class]];
       
        refreshBundle = [NSBundle bundleWithPath:[mainBundle pathForResource:@"YSHKit" ofType:@"bundle"]];
    }
    return refreshBundle;
}


+ (UIImage *)ysh_imageName:(NSString *)name
{
    NSString * path  = [[self ysh_kitBundle] pathForScaledResource:name ofType:@"png"];
    
    UIImage *arrowImage = nil;
    if (arrowImage == nil) {
       arrowImage =  [[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
       
        
    }
    return arrowImage;
}
@end
