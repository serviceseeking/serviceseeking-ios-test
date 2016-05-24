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
#import "APIError.h"

@implementation ErrorDisplayManager

+ (void)displayErrorWithAPIError:(APIError *)error inView:(UIView *)view {
    [view makeToast:error.detail duration:2.0 position:CSToastPositionBottom];
}

+ (void)displayErrorWithNSError:(NSError *)error inView:(UIView *)view {
    [view makeToast:error.localizedDescription duration:2.0 position:CSToastPositionBottom];
}

@end
