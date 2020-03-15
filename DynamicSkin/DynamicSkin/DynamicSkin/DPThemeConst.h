//
//  TZThemeConst.h
//  DynamicSkin
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//
@class DPThemeConfig;
typedef UIColor*_Nullable(^DynamicColorComplete)(DPThemeConfig* _Nullable config);
typedef void(^DynamicThemeUpdate)(DPThemeConfig* _Nullable config);
typedef UIImage*_Nullable(^DynamicImageComplete)(DPThemeConfig* _Nullable config);
