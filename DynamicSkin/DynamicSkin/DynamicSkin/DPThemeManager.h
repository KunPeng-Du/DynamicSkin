//
//  TZThemeManager.h
//  DynamicSkin
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DPThemeConfig.h"
#import "DPThemeConst.h"
NS_ASSUME_NONNULL_BEGIN

@interface DPThemeManager : NSObject
/**
 单例对象
 */
+(instancetype)manager;
/**
 @brief 动态主题
 @param block 主题切换回调block
 @param identifer block识别标识，用于清理销毁不需要的回调
 @return DPThemeConfig
 */
-(DPThemeConfig*)currentThemeConfig:(DynamicThemeUpdate)block WithIdentifier:(NSString*)identifer;

/**
 @brief 设置暗夜模式主题皮肤（程序启动时可以设置，暗夜模式下自动切换）
 */
-(void)pushDarkModeTheme:(DPThemeConfig*)darkConfig;
/**
 @brief 切换自定义主题
 @param currentConfig  新的主题
 */
-(void)pushCurrentThemme:(DPThemeConfig*)currentConfig;

/**
 @brief 模式改变了触发自动更新皮肤
 */
-(void)updateTheme;

/**
 @brief 视图销毁,移除更新回调（注意：动态绑定了视图更新的界面，需要在对象销毁时调用该方法）
 @param identifer 唯一标识
 */
-(void)removeUpdateWithIdentifer:(NSString*)identifer;
@end

NS_ASSUME_NONNULL_END
