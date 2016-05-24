//
//  User.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+ (instancetype)sharedUserInstance;

@property (strong, nonatomic, readonly) NSString *createdAt;
@property (strong, nonatomic, readonly) NSString *email;
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *phone;
@property (strong, nonatomic, readonly) NSString *status;
@property (strong, nonatomic, readonly) NSString *updatedAt;
@property (strong, nonatomic, readonly) NSString *token;

- (void)updateUserDataWithDictionary:(NSDictionary *)dictionary;
+ (void)clearSharedUserInstance;

@end
