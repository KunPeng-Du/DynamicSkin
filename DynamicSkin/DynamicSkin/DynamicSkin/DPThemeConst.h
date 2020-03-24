//
//  TZThemeConst.h
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


typedef UIColor*_Nullable(^DynamicColorComplete)(id  _Nullable config);
typedef void(^DynamicThemeUpdate)(id _Nullable config);
typedef UIImage*_Nullable(^DynamicImageComplete)(id  _Nullable config);
