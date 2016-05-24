//
//  NSString+Helper.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

- (NSDate *)toDate {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    return [dateFormatter dateFromString:self];
}
@end
