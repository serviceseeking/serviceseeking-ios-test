//
//  User.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "User.h"
#import "Keys.h"

static User *sharedUserInstance;

@interface User ()

@property (strong, nonatomic, readwrite) NSString *createdAt;
@property (strong, nonatomic, readwrite) NSString *email;
@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *phone;
@property (strong, nonatomic, readwrite) NSString *status;
@property (strong, nonatomic, readwrite) NSString *updatedAt;
@property (strong, nonatomic, readwrite) NSString *token;

@end

@implementation User

+ (instancetype)sharedUserInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserInstance = [[User alloc] init];
    });
    return sharedUserInstance;
}

- (void)updateUserDataWithDictionary:(NSDictionary *)dictionary {

    if (dictionary != nil) {
        NSDictionary *attributes = dictionary[kData][kAttributes];
        sharedUserInstance.createdAt = attributes[kCreatedAt] ?: nil;
        sharedUserInstance.email = attributes[kEmail] ?: nil;
        sharedUserInstance.name = attributes[kName] ?: nil;
        sharedUserInstance.phone = attributes[kPhone] ?: nil;
        sharedUserInstance.status = attributes[kStatus] ?: nil;
        sharedUserInstance.updatedAt = attributes[kUpdatedAt] ?: nil;
        sharedUserInstance.token = dictionary[kMeta][kToken] ?: nil;
    }
}

+ (void)clearSharedUserInstance {
    
    sharedUserInstance = nil;
}

@end
