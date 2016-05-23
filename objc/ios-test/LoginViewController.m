//
//  LoginViewController.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "LoginViewController.h"
#import "Config.h"

#import "API.h"

static NSString * const testEmail = @"test_business@serviceseeking.com.au";
static NSString * const testPassword = @"123123";

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
#if DEBUG_MODE == 1
    self.usernameTextField.text = testEmail;
    self.passwordTextField.text = testPassword;
#endif
}

- (IBAction)loginButtonClicked:(UIButton *)sender {
    
    [self.view endEditing:YES];
    
    [[API sharedClient] loginWithUsername:self.usernameTextField.text password:self.passwordTextField.text completionHandler:^(NSDictionary *responseDictionary) {

        
        
    }];
}

@end
