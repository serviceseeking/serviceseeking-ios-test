//
//  ViewController.m
//  ios-test
//
//  Created by Justine on 19/01/2016.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "ViewController.h"

NSString *token;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    token = [[NSString alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitRequet:(id)sender {
    //checks if inputs are valid
    if ([_textfield_username.text isEqualToString:@""] && [_textfield_username.text isEqualToString:@""]){
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Fields are empty" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction:alertAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        });
        
        
    }
    else if ([_textfield_username.text isEqualToString:@""]){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Username field is empty" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction:alertAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        });
        
        
    }
    else if ([_textfield_password.text isEqualToString:@""]){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Password empty" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction:alertAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        });
    }
    else{
        
        [_textfield_username resignFirstResponder];
        [_textfield_password resignFirstResponder];
        
        NSString *post = [NSString stringWithFormat:@"{\"data\":{\"type\":\"user_sessions\", \"attributes\":{\"email\":\"%@\", \"password\":\"%@\"}}}", _textfield_username, _textfield_password];
        
        
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        
        
        NSMutableURLRequest *theRequest=[NSMutableURLRequest
                                         requestWithURL:[NSURL URLWithString:
                                                         @"https://staging.serviceseeking.com.au/users/sign_in"]
                                         cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:60.0];
        
        
        
        [theRequest setHTTPMethod:@"POST"];
        
        [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [theRequest addValue:@"application/vnd.api+json; version=1" forHTTPHeaderField:@"Accept"];
        [theRequest addValue:@"application/vnd.api+json" forHTTPHeaderField:@"Content-Type"];
        [theRequest addValue:@"Basic c3NzdGFnaW5nOnNzVDNzdDFuZyE=" forHTTPHeaderField:@"Authorization"];
        
        
        [theRequest setHTTPBody:postData];
        
        [[[NSURLSession sharedSession] dataTaskWithRequest:theRequest
                                         completionHandler:^(NSData *data,
                                                             NSURLResponse *response,
                                                             NSError *error) {
                                             
                
                                             
                                             if (data == nil) {
                                                 NSLog(@"error");
                                             } else {
                                                 
                                                
                                                 
                                                 NSDictionary *json_data_response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
                                                 
                                                 NSString *string_response  = [[NSString alloc] init];
                                                 
                                                 for(NSString *string_response_key in json_data_response.allKeys)
                                                 {
                                                     string_response = string_response_key;
                                                 }

                                                 
                                                 if([string_response isEqualToString:@"errors"]){
                                                     
                                                     dispatch_async(dispatch_get_main_queue(), ^{
                                                        
                                                         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"The information entered is incorrect" preferredStyle:UIAlertControllerStyleAlert];
                                                         UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                                                         
                                                         [alert addAction:alertAction];
                                                         
                                                         [self presentViewController:alert animated:YES completion:nil];
                                                         
                                                     });
                                                     
                                                 }
                                                 
                                                 else{
                                                     
                                                     dispatch_async(dispatch_get_main_queue(), ^{
                                                         
                                                         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Login Successful" preferredStyle:UIAlertControllerStyleAlert];
                                                         UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                                                         
                                                         [alert addAction:alertAction];
                                                         
                                                         [self presentViewController:alert animated:YES completion:nil];
                                                         
                                                     });
                                                     
                                                     NSDictionary *dict_meta = [json_data_response objectForKey:@"meta"];
                                                     
                                                     NSString *str_get_token = [dict_meta objectForKey:@"token"];
                                                     
                                                     
                                                     token = str_get_token;
                                                     
                                                     MainViewController *main_VC = [[MainViewController alloc] init];
                                                     
                                                 
                                                     [main_VC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
                                                     
                                                     
                                                     [self presentViewController:main_VC animated:YES completion:nil];
                                                     
                                                 }
                                                 
                                                 
                                             }
           
            
        }] resume];
        
    }
    
}
@end
