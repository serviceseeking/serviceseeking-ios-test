//
//  MBProgressHUD+Loading.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "MBProgressHUD+Loading.h"

@implementation MBProgressHUD (Loading)

+ (MBProgressHUD *)showLoadingHUDAddedTo:(id)sender labelText:(NSString *)labelText detailLabelText:(NSString *)detailLabelText {
    [MBProgressHUD hideAllHUDsForView:sender animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:sender animated:YES];
    hud.color = [UIColor colorWithRed:59.0/255.0 green:70.0/255.0 blue:74.0/255.0 alpha:0.7];
    hud.opaque = NO;
    hud.labelText = labelText;
    hud.detailsLabelText = detailLabelText;
    hud.dimBackground = NO;
    
    return hud;
}

@end
