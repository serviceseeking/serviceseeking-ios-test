//
//  API+Login.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "API+Login.h"

@implementation API (Login)

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
             successBlock:(NetworkCallSuccessBlock)successBlock
                failBlock:(NetworkCallFailBlock)failBlock {
    NSDictionary *usernameAndPassword = @{kEmail: username, kPassword: password};
    NSDictionary *typeAndAttributes = @{kType: @"user_sessions", kAttributes: usernameAndPassword};
    NSMutableDictionary *parameters = @{kData: typeAndAttributes}.mutableCopy;
    
    [self POSTPath:PATH_SIGN_IN parameters:parameters successBlock:successBlock failBlock:failBlock];
}

@end
