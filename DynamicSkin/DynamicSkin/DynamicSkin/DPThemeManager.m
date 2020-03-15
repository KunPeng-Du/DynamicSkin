//
//  TZThemeManager.m
//  DynamicSkin
//
//  Created by DP on 2020/3/14.
//  Copyright © 2020 DKP. All rights reserved.
//

#import "DPThemeManager.h"

@interface DPThemeManager()
@property(nonatomic,strong)DPThemeModel *currentModel;
@property(nonatomic,strong)NSMutableArray *updateBlocks;
@property(nonatomic,copy)NSString*theme;
@property (strong, nonatomic) dispatch_semaphore_t blockLock;
@end
@implementation DPThemeManager
+(instancetype)manager{
    static DPThemeManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DPThemeManager alloc]init];
    });
    return _instance;
}
-(instancetype)init{
    if (self = [super init]) {
        _blockLock = dispatch_semaphore_create(1);
    }
    return self;
}
-(DPThemeConfig *)currentThemeConfig{
    if (@available(iOS 13.0, *)) {
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return self.currentModel.dark;
        }else{
            return self.currentModel.light;
        }
    }
    return self.currentModel.light;
}
-(DPThemeConfig*)currentThemeConfig:(DynamicThemeUpdate)block WithIdentifier:(NSString*)identifer{
    if (identifer && [identifer isKindOfClass:[NSString class]] && identifer.length>0 ) {
        TZ_LOCK(self.blockLock);
        [self.updateBlocks addObject:@{identifer:block}];
        TZ_UNLOCK(self.blockLock);
    }
#ifdef DEBUG
    NSLog(@"当前存储的block>>>>>>%lu",(unsigned long)self.updateBlocks.count);
#endif
    return [self currentThemeConfig];
}
-(BOOL)isHaveCurrentItem:(NSString*)itemKey{
    BOOL isHave = NO;
    for ( NSDictionary *item in self.updateBlocks) {
        NSArray *keys = item.allKeys;
        if ([keys containsObject:itemKey] ) {
            isHave = YES;
            break;
        }
    }
    return isHave;
}
-(void)setupTheme:(DPThemeModel*)theme{
    self.currentModel = theme;
}

-(NSMutableArray *)updateBlocks{
    if(!_updateBlocks){
        _updateBlocks = [NSMutableArray array];
    }
    return _updateBlocks;
}
-(void)changeThemme{
    DPThemeConfig *cfg = [self currentThemeConfig];
    for (NSDictionary *dict in self.updateBlocks) {
        NSMutableArray *values = (NSMutableArray*)dict.allValues;
        for (DynamicThemeUpdate block in values) {
            if (block) {
                block(cfg);
            }
        }
    }
}
-(void)changeThemme:(DPThemeModel *)theme{
    //切换主题
    [self setupTheme:theme];
    [self changeThemme];
}
-(void)removeUpdateWithIdentifer:(NSString*)identifer{
    if (identifer && identifer.length>0) {
        TZ_LOCK(self.blockLock);
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary*dict in self.updateBlocks) {
            if (![dict.allKeys containsObject:identifer]) {
                [arrM addObject:dict];
            }
        }
        self.updateBlocks = arrM;
        TZ_UNLOCK(self.blockLock);
    }
#ifdef DEBUG
    NSLog(@"当前存储的block>>>>>>%lu",(unsigned long)self.updateBlocks.count);
#endif
}
@end
