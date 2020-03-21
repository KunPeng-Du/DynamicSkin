//
//  NSObject+Dynamic.h
//  DynamicSkin
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DPThemeConst.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Dynamic)
/**
 @brief 视图销毁,不需更新回调
 @param identifer 唯一标识
 */
-(void)tz_dynamicTheme:(DynamicThemeUpdate)update WithIdentifier:(NSString*)identifer;
@end

NS_ASSUME_NONNULL_END
