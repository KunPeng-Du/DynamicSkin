//
//  DPOneVc.m
//  DynamicSkin
//
//  Created by DKP on 2020/3/15.
//  Copyright © 2020 DP. All rights reserved.
//

#import "DPOneVc.h"
#import "DPDynamicTheme.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "TestConfig.h"
@interface DPOneVc ()
@property(nonatomic,strong)UIButton *one;
@property(nonatomic,strong)UIButton *two;
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UILabel *statelabel;
@end

@implementation DPOneVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.one];
    [self.view addSubview:self.two];
    [self.view addSubview:self.image];
    [self.view addSubview:self.statelabel];
    __weak typeof (self)weakSelf = self;
    [self tz_dynamicTheme:^(TestConfig * _Nullable config) {
        [weakSelf.image sd_setImageWithURL:[NSURL URLWithString:config.img1]];
        weakSelf.statelabel.text = config.state;
    } WithIdentifier:NSStringFromClass([self class])];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.one.frame = CGRectMake((self.view.bounds.size.width-100)*0.5, 100, 100, 40);
    self.two.frame = CGRectMake((self.view.bounds.size.width-100)*0.5, 200, 100, 40);
    self.image.frame = CGRectMake(0, self.view.bounds.size.height-250, self.view.bounds.size.width, 200);
      self.statelabel.frame = CGRectMake(0, self.view.bounds.size.height-300, self.view.bounds.size.width, 40);
}
-(UIButton *)one{
    if(!_one){
        _one = [[UIButton alloc]init];
        _one.tag = 100;
        _one.layer.cornerRadius = 20;
        _one.layer.masksToBounds = YES;
        [_one setBackgroundColor:[UIColor blueColor]];
          [_one setTitle:@"ThemeOne" forState:UIControlStateNormal];
        [_one addTarget: self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _one;
}
-(UIButton *)two{
    if(!_two){
        _two = [[UIButton alloc]init];
         _two.tag = 200;
        _two.layer.cornerRadius = 20;
        _two.layer.masksToBounds = YES;
        [_two setBackgroundColor:[UIColor blueColor]];
        [_two setTitle:@"ThemeTwo" forState:UIControlStateNormal];
         [_two addTarget: self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _two;
}
-(UIImageView *)image{
    if (!_image ) {
        _image = [[UIImageView alloc]init];
    }
    return _image;
}
-(UILabel *)statelabel{
    if (!_statelabel) {
        _statelabel = [[UILabel alloc]init];
        _statelabel.textAlignment = NSTextAlignmentCenter;
        _statelabel.textColor = [UIColor redColor];
    }
    return _statelabel;
}
-(void)btnClick:(UIButton*)sender{
    NSDictionary *dataSource = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"]];
    
    switch (sender.tag) {
        case 100:{
             TestConfig*config = [TestConfig mj_objectWithKeyValues: [dataSource objectForKey:@"one"]];
            [[DPThemeManager manager] pushCurrentThemme:config];
        }
            break;
        case 200:{
            TestConfig *config = [TestConfig mj_objectWithKeyValues: [dataSource objectForKey:@"two"]];
              [[DPThemeManager manager] pushCurrentThemme:config];
        }
                
            break;
        default:
            break;
    }
}
-(void)dealloc{
    [[DPThemeManager manager] removeUpdateWithIdentifer:NSStringFromClass([self class])];
}
@end
