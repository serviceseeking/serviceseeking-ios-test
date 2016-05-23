//
//  API.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HTTPRequestCompletionBlock)(NSDictionary *responseDictionary);

@interface API : NSObject

+ (instancetype)sharedClient;

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
        completionHandler:(HTTPRequestCompletionBlock)completionHandler;

- (void)getLeadsListingWithCompletionHandler:(HTTPRequestCompletionBlock)completionHandler;

@end
