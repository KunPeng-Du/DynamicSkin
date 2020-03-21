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
@interface DPOneVc ()
@property(nonatomic,strong)UIButton *one;
@property(nonatomic,strong)UIButton *two;
@property(nonatomic,strong)UIImageView *image;
@end

@implementation DPOneVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.one];
    [self.view addSubview:self.two];
    [self.view addSubview:self.image];
    __weak typeof (self)weakSelf = self;
//    [self tz_dynamicTheme:^(DPThemeConfig * _Nullable config) {
//        [weakSelf.image sd_setImageWithURL:[NSURL URLWithString:config.img1]];
//    } WithIdentifier:NSStringFromClass([self class])];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.one.frame = CGRectMake((self.view.bounds.size.width-100)*0.5, 100, 100, 40);
    self.two.frame = CGRectMake((self.view.bounds.size.width-100)*0.5, 200, 100, 40);
    self.image.frame = CGRectMake(0, self.view.bounds.size.height-250, self.view.bounds.size.width, 200);
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
-(void)btnClick:(UIButton*)sender{
    NSDictionary *dataSource = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"]];
    
    switch (sender.tag) {
        case 100:{
            DPThemeModel *model = [DPThemeModel mj_objectWithKeyValues: [dataSource objectForKey:@"one"]];
            [[DPThemeManager manager] pushCurrentThemme:model];
        }
            break;
        case 200:{
            DPThemeModel *model = [DPThemeModel mj_objectWithKeyValues: [dataSource objectForKey:@"two"]];
            [[DPThemeManager manager] pushCurrentThemme:model];
        }
                
            break;
        default:
            break;
    }
}
@end
