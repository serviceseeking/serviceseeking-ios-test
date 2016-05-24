//
//  LoginViewController.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "LoginViewController.h"

#import "Config.h"
#import "User.h"
#import "API+Login.h"
#import "MBProgressHUD+Loading.h"

static NSString * const testEmail = @"test_business@serviceseeking.com.au";
static NSString * const testPassword = @"123123";
static NSString * const segueIDLoginToLeads = @"loginToLeads";

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
    
    [MBProgressHUD showLoadingHUDAddedTo:self.view labelText:@"Log in" detailLabelText:@"Please wait . . ."];
    
    [[API sharedClient] loginWithUsername:self.usernameTextField.text password:self.passwordTextField.text completionHandler:^(NSDictionary *responseDictionary) {
        
        [[User sharedUserInstance] updateUserDataWithDictionary:responseDictionary];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:sender animated:YES];
            [self performSegueWithIdentifier:segueIDLoginToLeads sender:nil];
        });
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:segueIDLoginToLeads]) {
        
    }
}

@end
