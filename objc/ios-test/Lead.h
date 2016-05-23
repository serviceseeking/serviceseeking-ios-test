//
//  Lead.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lead : NSObject

@property (strong, nonatomic, readonly) NSString *ID;

@property (strong, nonatomic, readonly) NSString *biddingClosesOn;
@property (assign, nonatomic, readonly) BOOL canQuote;
@property (strong, nonatomic, readonly) NSString *createdAt;
@property (strong, nonatomic, readonly) NSString *desc;
@property (strong, nonatomic, readonly) NSString *distanceAway;
@property (strong, nonatomic, readonly) NSString *name;
@property (assign, nonatomic, readonly, getter=isFeatured) BOOL featured;
@property (assign, nonatomic, readonly, getter=isNew) BOOL new;
@property (assign, nonatomic, readonly, getter=isPrivate) BOOL private;
@property (strong, nonatomic, readonly) NSString *suburbName;
@property (strong, nonatomic, readonly) NSString *updatedAt;
@property (assign, nonatomic, readonly, getter=isUrgent) BOOL urgent;
@property (strong, nonatomic, readonly) NSString *userName;
@property (assign, nonatomic, readonly, getter=isWithinRange) BOOL withinRange;

- (instancetype)initWithDataDictionary:(NSDictionary *)data;

@end
