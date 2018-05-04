//
//  LoginProtocol.h
//  ModuleProtocols
//
//  Created by yin linlin on 2018/5/3.
//

#import <Foundation/Foundation.h>

@protocol LoginProtocol <NSObject>


- (void)presentLoginMoudleFromVC:(UIViewController* )controller complete:(void(^)(BOOL success))complete;


@end
