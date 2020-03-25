
# DynamicSkin

**一款便捷的动态换肤组件。（Switch theme and skin dynamically for you APP）**

+ **代码简洁，便于维护；**
+ **自动适配暗夜模式，不需要自己每个界面去监听模式的切换；**

### 如何使用

+ **1.引入框架，导入头文件**
    手动引入或者通过CocoaPods
```objc
pod 'DynamicSkin'
```
```objc
#import "DPDynamicTheme.h"
```
+ **2.配置模型**
继承DPThemeConfig，根据自己的需求，配置相应字段即可。
```objc
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
```
+ **3.设置默认主题**
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      NSDictionary *dataSource = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"]];
      TestConfig *one = [TestConfig mj_objectWithKeyValues: [dataSource objectForKey:@"one"]];
        [[DPThemeManager manager]pushCurrentThemme:one];
    //这里需要主动设置一套暗夜模式的主题，用户切换时自动替换。如果不设置，需要自己监听暗夜模式是否开启，开启时主动切换到暗夜模式皮肤。
        TestConfig *dark = [TestConfig mj_objectWithKeyValues: [dataSource objectForKey:@"dark"]];
        [[DPThemeManager manager]pushDarkModeTheme:dark];
    return YES;
}
```
+ **4.数据绑定**
```objc
    __weak typeof (self)weakSelf = self;
//用户切换暗夜模式，或则主动切换pushCurrentThemme:，会触发该回调
    [self tz_dynamicTheme:^(TestConfig * _Nullable config) {
        [weakSelf.image sd_setImageWithURL:[NSURL URLWithString:config.img1]];
        weakSelf.statelabel.text = config.state;
    } WithIdentifier:NSStringFromClass([self class])];
}
```
+ **5.销毁不需要的回调**
```objc
-(void)dealloc{
  //identifer需要和当前界面绑定的保持一致
    [[DPThemeManager manager] removeUpdateWithIdentifer:NSStringFromClass([self class])];
}
```
*****

![Image text](https://upload-images.jianshu.io/upload_images/2478673-6ee444d836689f03.gif?imageMogr2/auto-orient/strip)







