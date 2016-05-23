//
//  NSDictionary+Helper.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "NSDictionary+Helper.h"

static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

static NSString *urlEncode(id object) {
    NSString *string = toString(object);
    return [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

@implementation NSDictionary (Helper)

- (NSData *)toData {
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    return postData;
}

- (NSString*)urlEncodedString {
    NSMutableArray *parts = [NSMutableArray array];
    
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
    return [[parts componentsJoinedByString: @"&"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

@end
