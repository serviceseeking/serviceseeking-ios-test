//
//  Lead.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "Lead.h"

#import "Keys.h"

@interface Lead ()

@property (strong, nonatomic, readwrite) NSString *ID;

@property (strong, nonatomic, readwrite) NSString *biddingClosesOn;
@property (assign, nonatomic, readwrite) BOOL canQuote;
@property (strong, nonatomic, readwrite) NSString *createdAt;
@property (strong, nonatomic, readwrite) NSString *desc;
@property (strong, nonatomic, readwrite) NSString *distanceAway;
@property (strong, nonatomic, readwrite) NSString *name;
@property (assign, nonatomic, readwrite, getter=isFeatured) BOOL featured;
@property (assign, nonatomic, readwrite, getter=isNew) BOOL new;
@property (assign, nonatomic, readwrite, getter=isPrivate) BOOL private;
@property (strong, nonatomic, readwrite) NSString *suburbName;
@property (strong, nonatomic, readwrite) NSString *updatedAt;
@property (assign, nonatomic, readwrite, getter=isUrgent) BOOL urgent;
@property (strong, nonatomic, readwrite) NSString *userName;
@property (assign, nonatomic, readwrite, getter=isWithinRange) BOOL withinRange;

@end

@implementation Lead

- (instancetype)initWithDataDictionary:(NSDictionary *)data {
    
    Lead *leads = [[Lead alloc] init];
    
    if (data != nil) {
        leads.ID = data[kId];
        
        NSDictionary *attributes = data[kAttributes];
        leads.biddingClosesOn = attributes[kBiddingClosesOn] ?: nil;
        leads.canQuote = attributes[kCanQuote] ? YES : NO;
        leads.createdAt = attributes[kCreatedAt] ?: nil;
        leads.desc = attributes[kDescription] ?: nil;
        leads.distanceAway = attributes[kDistanceAway] ?: nil;
        leads.featured = attributes[kFeatured] ? NO : YES;
        leads.name = attributes[kName] ?: nil;
        leads.new = attributes[kNew] ? NO : YES;
        leads.private = attributes[kPrivate] ? NO : YES;
        leads.suburbName = attributes[kSuburbName] ?: nil;
        leads.updatedAt = attributes[kUpdatedAt] ?: nil;
        leads.urgent = attributes[kUrgent] ? NO : YES;
        leads.userName = attributes[kUserName] ?: nil;
        leads.withinRange = attributes[kWithinRange] ? NO : YES;
    }
    return leads;
}

@end
