//
//  MBProgressHUD+Loading.h
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Loading)

+ (MBProgressHUD *)showLoadingHUDAddedTo:(id)sender labelText:(NSString *)labelText detailLabelText:(NSString *)detailLabelText;

@end
