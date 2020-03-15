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
@property(nonatomic,copy)NSString*color1;
@property(nonatomic,copy)NSString*color2;
@property(nonatomic,copy)NSString*img1;
@property(nonatomic,copy)NSString*tabOne;
@property(nonatomic,copy)NSString*tabTwo;
@property(nonatomic,copy)NSString*tabThree;
@property(nonatomic,copy)NSString*tabTextColorNormal;
@property(nonatomic,copy)NSString*tabTextColorSelect;
@end

NS_ASSUME_NONNULL_END
