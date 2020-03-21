//
//  AppDelegate.m
//  DynamicSkin
//
//  Created by DKP on 2020/3/15.
//  Copyright © 2020 DP. All rights reserved.
//

#import "AppDelegate.h"
#import "DPDynamicTheme.h"
#import "MJExtension.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      NSDictionary *dataSource = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"]];
      DPThemeModel *model = [DPThemeModel mj_objectWithKeyValues: [dataSource objectForKey:@"one"]];
   [[DPThemeManager manager]pushCurrentThemme:model];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
