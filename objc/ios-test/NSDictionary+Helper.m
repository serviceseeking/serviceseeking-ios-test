//
//  NSDictionary+Helper.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

- (NSData *)convertToData {
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    return postData;
}

@end
