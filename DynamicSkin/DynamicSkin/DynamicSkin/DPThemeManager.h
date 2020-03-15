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
#import "DPThemeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DPThemeManager : NSObject
/**
 单例对象
*/
+(instancetype)manager;
/**
初始化主题
 
@param theme 设置主题
*/
//-(void)setupTheme:(NSString*)theme;
-(void)setupTheme:(DPThemeModel*)theme;
/**
 生成动态color
 
@param block 主题切换回调block
@param identifer block识别n标识，用于清理销毁不需要的回调
@return TZThemeConfig
*/
-(DPThemeConfig*)currentThemeConfig:(DynamicThemeUpdate)block WithIdentifier:(NSString*)identifer;
/**
切换主题，用于系统暗夜模式切换
*/
-(void)changeThemme;
/**
 切换自定义主题
 
@param theme 主题key
*/
-(void)changeThemme:(DPThemeModel*)theme;
/**
视图销毁移除不需要等更新回调
 
@param identifer 视图对应唯一标识
*/
-(void)removeUpdateWithIdentifer:(NSString*)identifer;
@end

NS_ASSUME_NONNULL_END
