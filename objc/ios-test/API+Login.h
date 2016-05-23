//
//  API+Login.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "API.h"

@interface API (Login)

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
        completionHandler:(HTTPRequestCompletionBlock)completionHandler;

@end
