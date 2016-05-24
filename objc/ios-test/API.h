//
//  API.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URL.h"
#import "Keys.h"
#import "APIError.h"

typedef void(^NetworkCallSuccessBlock)(NSDictionary *responseDictionary);
typedef void(^NetworkCallFailBlock)(APIError *apiError, NSError *error);

@interface API : NSObject

+ (instancetype)sharedClient;

- (void)includeToken:(NSString *)token;

- (void)GETPath:(NSString *)path
      parameter:(id)parameter
   successBlock:(NetworkCallSuccessBlock)successBlock
      failBlock:(NetworkCallFailBlock)failBlock;

- (void)POSTPath:(NSString *)path
      parameters:(NSDictionary *)parameters
    successBlock:(NetworkCallSuccessBlock)successBlock
       failBlock:(NetworkCallFailBlock)failBlock;

@end
