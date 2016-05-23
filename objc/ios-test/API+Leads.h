//
//  API+Leads.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "API.h"

@interface API (Leads)

- (void)getLeadsListingWithPageNumber:(NSNumber *)number
                             pageSize:(NSNumber *)size
                    completionHandler:(HTTPRequestCompletionBlock)completionHandler;

@end
