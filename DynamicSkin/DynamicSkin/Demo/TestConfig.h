//
//  TestConfig.h
//  DynamicSkin
//
//  Created by DKP on 2020/3/22.
//  Copyright © 2020 DP. All rights reserved.
//

#import "DPThemeConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestConfig : DPThemeConfig
@property(nonatomic,copy)NSString*color1;
@property(nonatomic,copy)NSString*color2;
@property(nonatomic,copy)NSString*img1;
@property(nonatomic,copy)NSString*tabOne;
@property(nonatomic,copy)NSString*tabTwo;
@property(nonatomic,copy)NSString*tabThree;
@property(nonatomic,copy)NSString*tabTextColorNormal;
@property(nonatomic,copy)NSString*tabTextColorSelect;
@property(nonatomic,copy)NSString*state;
@end

NS_ASSUME_NONNULL_END
