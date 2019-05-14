#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YSHPopTool.h"
#import "YSHUpdateVersionHelper.h"
#import "YSHUpdateVersionModel.h"
#import "YSHVersionAlertView.h"

FOUNDATION_EXPORT double YSHVersionHelperVersionNumber;
FOUNDATION_EXPORT const unsigned char YSHVersionHelperVersionString[];

