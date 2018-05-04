//
//  LoginViewModel.m
//  LoginMoudle
//
//  Created by yin linlin on 2018/4/19.
//

#import "LoginViewModel.h"

@implementation LoginViewModel
- (instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.validLoginSignal = [[RACSignal combineLatest:@[RACObserve(self, username),RACObserve(self, password)] reduce:^(NSString *username, NSString *password) {
        return @(username.length > 6 && password.length > 6);
    }] distinctUntilChanged];
}
@end
