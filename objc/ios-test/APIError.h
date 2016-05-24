//
//  APIError.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/24/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIError : NSObject

@property (strong, nonatomic, readonly) NSNumber *code;
@property (strong, nonatomic, readonly) NSString *detail;
@property (strong, nonatomic, readonly) NSString *ID;
@property (strong, nonatomic, readonly) NSString *links;
@property (strong, nonatomic, readonly) NSString *status;
@property (strong, nonatomic, readonly) NSString *title;

- (instancetype)initWithDataWithDictionary:(NSDictionary *)data;

@end
