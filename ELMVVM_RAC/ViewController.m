//
//  ViewController.m
//  ELMVVM_RAC
//
//  Created by yin linlin on 2018/4/19.
//  Copyright © 2018年 EL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@50);
        make.centerX.equalTo(self.view);
        make.top.equalTo(@60);
        make.height.equalTo(@40);
    }];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loginBtnPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginBtnPressed {
    id loginService = [ELProtocolManager serviceProvideForProtocol:@protocol(LoginProtocol)];
    [loginService presentLoginMoudleFromVC:self complete:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
