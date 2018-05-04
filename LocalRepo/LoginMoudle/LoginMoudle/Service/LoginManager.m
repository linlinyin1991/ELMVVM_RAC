//
//  LoginManager.m
//  LoginMoudle
//
//  Created by yin linlin on 2018/5/3.
//

#import "LoginManager.h"

#import <ModuleProtocols/LoginProtocol.h>
#import <MediaService/ELProtocolManager.h>
#import "LoginViewController.h"

@interface LoginManager ()<LoginProtocol>

@end

@implementation LoginManager

+ (void)regist {
    [ELProtocolManager registServiceProvide:[[self alloc] init] forProtocol:@protocol(LoginProtocol)];
}

- (void)presentLoginMoudleFromVC:(UIViewController* )controller complete:(void(^)(BOOL success))complete {
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [controller presentViewController:nav animated:YES completion:nil];
}

@end
