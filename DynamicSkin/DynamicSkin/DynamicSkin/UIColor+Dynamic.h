//
//  UIColor+Dynamic.h
//  ThemeDemo
//
//  Created by 潭州教育 on 2020/3/12.
//  Copyright © 2020 时光博客. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPThemeConst.h"
NS_ASSUME_NONNULL_BEGIN
@interface UIColor (Dynamic)
+(UIColor*)dp_dynamicColorCompete:(DynamicColorComplete)complete Update:(DynamicThemeUpdate)update WithIdentifier:(NSString*)identifer;
+ (UIColor* )dp_colorWithHexString:(NSString *)hexString;
@end

NS_ASSUME_NONNULL_END
