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
        sharedUserInstance.createdAt = attributes[kCreatedAt];
        sharedUserInstance.email = attributes[kEmail];
        sharedUserInstance.name = attributes[kName];
        sharedUserInstance.phone = attributes[kPhone];
        sharedUserInstance.status = attributes[kStatus];
        sharedUserInstance.updatedAt = attributes[kUpdatedAt];
        sharedUserInstance.token = dictionary[kMeta][kToken];
    }
}

+ (void)clearSharedUserInstance {
    
    sharedUserInstance = nil;
}

@end
