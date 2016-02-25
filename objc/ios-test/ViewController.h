//
//  ViewController.h
//  ios-test
//
//  Created by Justine on 19/01/2016.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

extern NSString *token;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textfield_username;
@property (weak, nonatomic) IBOutlet UITextField *textfield_password;
- (IBAction)submitRequet:(id)sender;

@end

