//
//  TZThemeConfig.h
//  DynamicSkin
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//
#ifndef TZ_LOCK
#define TZ_LOCK(lock) dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
#endif

#ifndef TZ_UNLOCK
#define TZ_UNLOCK(lock) dispatch_semaphore_signal(lock);
#endif

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DPThemeConfig : NSObject
/**
 根据自己需求配置该模型（更新时会拿到这里所有的信息）
 如：导航栏背景色
@property(nonatomic,copy)NSString *navBarColor;
 .
 .
 .
 .
 */

@end

NS_ASSUME_NONNULL_END
