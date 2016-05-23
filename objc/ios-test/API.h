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

typedef void(^HTTPRequestCompletionBlock)(NSDictionary *responseDictionary);

@interface API : NSObject

+ (instancetype)sharedClient;

- (void)includeToken:(NSString *)token;

- (void)GETPath:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(HTTPRequestCompletionBlock)completionHandler;

- (void)POSTPath:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(HTTPRequestCompletionBlock)completionHandler;

@end
