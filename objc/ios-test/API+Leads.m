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

- (void)getLeadsListingWithCompletionHandler:(HTTPRequestCompletionBlock)completionHandler {
    [self includeToken:[User sharedUserInstance].token];
    [self requestWithMethod:@"GET" path:PATH_LEADS parameters:nil completionHandler:completionHandler];
}

@end
