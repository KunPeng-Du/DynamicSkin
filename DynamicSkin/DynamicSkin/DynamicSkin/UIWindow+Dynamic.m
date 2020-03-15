//
//  UIWindow+Dynamic.m
//  DynamicSkin
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//

#import "UIWindow+Dynamic.h"
#import <objc/runtime.h>
#import "DPThemeManager.h"
static const char TZCurrentUserStyleKey = '\0';
@implementation UIWindow (Dynamic)

+ (void)initialize
{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
      Method originM = class_getInstanceMethod([self class], @selector(traitCollection));
      Method newM = class_getInstanceMethod([self class], @selector(TZ_traitCollection));
      method_exchangeImplementations(originM, newM);
  });
}
-(UITraitCollection*)TZ_traitCollection{
    if (@available(iOS 13.0, *)) {
        if (UIApplication.sharedApplication.applicationState == UIApplicationStateBackground) {
            return [self TZ_traitCollection];
        }
        if([NSStringFromClass([self class]) isEqualToString:@"UITextEffectsWindow"]){
            return [self TZ_traitCollection];
        }
        if (self.currentStyle ==self.TZ_traitCollection.userInterfaceStyle) {
            return [self TZ_traitCollection];
        }else{
            NSLog(@">>>>%ld>>>>>%ld>>>>%@",(long)self.currentStyle,self.TZ_traitCollection.userInterfaceStyle,NSStringFromClass([self class]));
            self.currentStyle =self.TZ_traitCollection.userInterfaceStyle;
            //用户切换了模式
            [[DPThemeManager manager]changeThemme];
        }
    }else{
        return [self TZ_traitCollection];
    }
    return [self TZ_traitCollection];
}
- (void)setCurrentStyle:(UIUserInterfaceStyle)currentStyle{
    int t = (int)currentStyle;
    objc_setAssociatedObject(self, &TZCurrentUserStyleKey,[NSNumber numberWithInt:t], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIUserInterfaceStyle)currentStyle{
    NSNumber *temp  = objc_getAssociatedObject(self, &TZCurrentUserStyleKey);
    if(temp.intValue == 1) {
        return UIUserInterfaceStyleLight;
    }else if (temp.intValue == 2){
        return UIUserInterfaceStyleDark;
    }else {
        return UIUserInterfaceStyleUnspecified;
    }
}
@end
