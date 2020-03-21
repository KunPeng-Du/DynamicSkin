//
//  UIColor+Dynamic.h
//  ThemeDemo
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPThemeConst.h"
NS_ASSUME_NONNULL_BEGIN
@interface UIColor (Dynamic)
/**
 @brief 生成动态颜色（请使用NSObject+Dynamicd对应方法，更加简便）
 @param complete 设置完成block
 @param update  主题发生变化后调block
 @return UIColor
 */
+(UIColor*)dp_dynamicColorCompete:(DynamicColorComplete)complete Update:(DynamicThemeUpdate)update WithIdentifier:(NSString*)identifer;
/**
 十六进制颜色
 */
+ (UIColor* )dp_colorWithHexString:(NSString *)hexString;
@end

NS_ASSUME_NONNULL_END
