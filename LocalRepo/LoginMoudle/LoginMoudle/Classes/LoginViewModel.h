//
//  LoginViewModel.h
//  LoginMoudle
//
//  Created by yin linlin on 2018/4/19.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/RACSignal.h>

@interface LoginViewModel : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
/// 登录按钮有效性x
@property (nonatomic, strong) RACSignal *validLoginSignal;

@end
