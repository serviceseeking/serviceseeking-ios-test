//
//  APIError.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/24/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "APIError.h"
#import "Keys.h"

@interface APIError ()

@property (strong, nonatomic, readwrite) NSNumber *code;
@property (strong, nonatomic, readwrite) NSString *detail;
@property (strong, nonatomic, readwrite) NSString *ID;
@property (strong, nonatomic, readwrite) NSString *links;
@property (strong, nonatomic, readwrite) NSString *status;
@property (strong, nonatomic, readwrite) NSString *title;

@end

@implementation APIError

- (instancetype)initWithDataWithDictionary:(NSDictionary *)data {
    
    APIError *error = [[APIError alloc] init];
    
    error.code = data[kCode];
    error.detail = data[kDetail];
    error.ID = data[kId];
    error.links = data[kLinks];
    error.status = data[kStatus];
    error.title = data[kTitle];
    
    return error;
}

@end
