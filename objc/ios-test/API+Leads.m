//
//  API+Leads.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "API+Leads.h"

#import "User.h"

@implementation API (Leads)

#pragma mark - Leads

- (void)getLeadsListingWithPageNumber:(NSNumber *)number
                             pageSize:(NSNumber *)size
                    completionHandler:(HTTPRequestCompletionBlock)completionHandler {
    
    [self includeToken:[User sharedUserInstance].token];
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    if (![number isEqualToNumber:@0] && ![number isEqualToNumber:@1]) {
        [parameters setValue:number forKey:@"page[number]"];
        [parameters setValue:size forKey:@"page[size]"];
    }
    else {
        parameters = nil;
    }
    [self GETPath:PATH_LEADS parameter:parameters completionHandler:completionHandler];
}

- (void)getLeadWithID:(NSNumber *)ID
    completionHandler:(HTTPRequestCompletionBlock)completionHandler {
    
    [self includeToken:[User sharedUserInstance].token];
    [self GETPath:PATH_LEADS parameter:ID completionHandler:completionHandler];
}

@end
