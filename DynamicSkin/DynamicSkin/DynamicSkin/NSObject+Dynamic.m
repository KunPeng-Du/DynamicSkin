//
//  NSObject+Dynamic.m
//  DynamicSkin
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//

#import "NSObject+Dynamic.h"
#import "DPThemeManager.h"

@implementation NSObject (Dynamic)
-(void)dp_dynamicTheme:(DynamicThemeUpdate)update WithIdentifier:(NSString*)identifer{
     update([[DPThemeManager manager] currentThemeConfig:(DynamicThemeUpdate)update WithIdentifier:(NSString*)identifer]);
}
@end
