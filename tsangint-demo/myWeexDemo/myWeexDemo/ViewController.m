//
//  ViewController.m
//  myWeexDemo
//
//  Created by alisa on 2017/10/23.
//  Copyright © 2017年 tsangint. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WXSDKInstance *_instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = self.view.frame; //必需
    NSString *url = [NSString stringWithString:@"http://127.0.0.1"];
    [_instance renderWithURL:self.url options:@{@"bundleUrl":[url absoluteString]} data:nil];
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    _instance.onFailed = ^(NSError *error) {
        //处理失败回调的逻辑。
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //处理页面渲染完成的逻辑。
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
