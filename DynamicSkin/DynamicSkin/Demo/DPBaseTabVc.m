//
//  DPBaseTabVc.m
//  DynamicSkin
//
//  Created by DKP on 2020/3/15.
//  Copyright © 2020 DP. All rights reserved.
//

#import "DPBaseTabVc.h"
#import "DPOneVc.h"
#import "DPTwoVc.h"
#import "DPThreeVc.h"
#import "DPDynamicTheme.h"
#import "TestConfig.h"
@interface DPBaseTabVc ()<UITabBarDelegate>

@end

@implementation DPBaseTabVc

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupMainVc];
    }
    return self;
}
-(void)setupMainVc{
    
    [self addTabVc:[[DPOneVc alloc] init] withTittle:@"one"];
    [self addTabVc:[[DPTwoVc alloc] init] withTittle:@"two"];
    [self addTabVc:[[DPThreeVc alloc] init] withTittle:@"three"];
}
-(void)addTabVc:(UIViewController*)vc withTittle:(NSString*)title{
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.title =title ;
    [self dp_dynamicTheme:^(TestConfig * _Nullable config) {
        if ([title isEqualToString:@"one"]) {
            nv.tabBarItem.image = [UIImage imageNamed:config.tabOne];
//            nv.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
        }else if ([title isEqualToString:@"two"]){
            nv.tabBarItem.image = [UIImage imageNamed:config.tabTwo];
//            nv.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
        }else if ([title isEqualToString:@"three"]){
            nv.tabBarItem.image = [UIImage imageNamed:config.tabTwo];
//            nv.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
        }
        self.tabBar.tintColor = [UIColor dp_colorWithHexString:config.tabTextColorNormal];
    
    } WithIdentifier:NSStringFromClass([self class])];
    
    [self addChildViewController:nv];
}
@end
