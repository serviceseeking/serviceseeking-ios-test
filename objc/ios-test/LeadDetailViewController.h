//
//  LeadDetailViewController.h
//  ios-test
//
//  Created by Reggie Cabalo on 25/02/2016.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "ViewController.h"

@interface LeadDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label_username;
@property (weak, nonatomic) IBOutlet UILabel *label_name;
@property (weak, nonatomic) IBOutlet UILabel *label_description;
@property (weak, nonatomic) IBOutlet UILabel *label_suburbName;

@end
