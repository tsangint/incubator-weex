//
//  ViewController.m
//  myWeexDemo
//
//  Created by alisa on 2017/10/23.
//  Copyright © 2017年 tsangint. All rights reserved.
//

#import "ViewController.h"
#import <WeexSDK/WXSDKInstance.h>

@interface ViewController ()

@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    _instance = [[WXSDKInstance alloc] init];
//    _instance.viewController = self;
//    _instance.frame = self.view.frame; //必需
//    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:12580/examples/build/vue/index.js"];
//    [_instance renderWithURL:url options:@{@"bundleUrl":[url absoluteString]} data:nil];
//
//    __weak typeof(self) weakSelf = self;
//    _instance.onCreate = ^(UIView *view) {
//        [weakSelf.weexView removeFromSuperview];
//        weakSelf.weexView = view;
//        [weakSelf.view addSubview:weakSelf.weexView];
//    };
    
    CGFloat width = self.view.frame.size.width;
    [_instance destroyInstance];
    _instance = [[WXSDKInstance alloc] init];
//    if([WXPrerenderManager isTaskExist:[self.url absoluteString]]){
//        _instance = [WXPrerenderManager instanceFromUrl:self.url.absoluteString];
//    }
    
    _instance.viewController = self;
    _instance.frame = CGRectMake(self.view.frame.size.width-width, 0, width, (self.view.frame.size.height - 64));
    
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, weakSelf.weexView);
    };
    
    _instance.onFailed = ^(NSError *error) {
        //处理失败回调的逻辑。
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //处理页面渲染完成的逻辑。
    };
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:12580/examples/build/vue/index.js"];
    [_instance renderWithURL:url options:@{@"bundleUrl":[url absoluteString]} data:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
