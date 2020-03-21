//
//  TZThemeModel.h
//  DynamicSkin
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPThemeConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface DPThemeModel : NSObject
/**
 默认模式
 */
@property(nonatomic,strong)DPThemeConfig *light;
/**
暗夜模式（Dark Mode）
*/
@property(nonatomic,strong)DPThemeConfig *dark;
@end

NS_ASSUME_NONNULL_END
