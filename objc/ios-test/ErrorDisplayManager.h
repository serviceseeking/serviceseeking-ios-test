//
//  ErrorDisplayManager.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/24/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class APIError;

@interface ErrorDisplayManager : NSObject

+ (void)displayErrorWithAPIError:(APIError *)error inView:(UIView *)view;

+ (void)displayErrorWithNSError:(NSError *)error inView:(UIView *)view;
    
@end
