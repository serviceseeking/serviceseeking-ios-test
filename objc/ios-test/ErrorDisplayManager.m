//
//  ErrorDisplayManager.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/24/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "ErrorDisplayManager.h"
#import "Keys.h"
#import "UIView+Toast.h"

static ErrorDisplayManager *sharedManger;

@interface ErrorDisplayManager ()

@property (strong, nonatomic, readwrite) NSNumber *code;
@property (strong, nonatomic, readwrite) NSString *detail;
@property (strong, nonatomic, readwrite) NSString *ID;
@property (strong, nonatomic, readwrite) NSString *links;
@property (strong, nonatomic, readwrite) NSString *status;
@property (strong, nonatomic, readwrite) NSString *title;

@end

@implementation ErrorDisplayManager

+ (instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManger = [[ErrorDisplayManager alloc] init];
    });
    return sharedManger;
}

- (void)updateErrorDataWithDictionary:(NSDictionary *)data {

    self.code = data[kCode] ?: nil;
    self.detail = data[kDetail] ?: nil;
    self.ID = data[kId] ?: nil;
    self.links = data[kLinks] ?: nil;
    self.status = data[kStatus] ?: nil;
    self.title = data[kTitle] ?: nil;
}

- (void)displayErrorWithDictionary:(NSDictionary *)dictionary inView:(UIView *)view {
    [self updateErrorDataWithDictionary:dictionary];
    [view makeToast:[ErrorDisplayManager sharedManager].detail duration:2.0 position:CSToastPositionBottom];
}

@end
