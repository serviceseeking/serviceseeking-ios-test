//
//  LeadDetailViewController.m
//  ios-test
//
//  Created by Reggie Cabalo on 25/02/2016.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "LeadDetailViewController.h"

@interface LeadDetailViewController ()

@end

@implementation LeadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableURLRequest *theRequest=[NSMutableURLRequest
                                     requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://staging.serviceseeking.com.au/leads/%@", stringID]
                                                     ]
                                     cachePolicy:NSURLRequestUseProtocolCachePolicy
                                     timeoutInterval:60.0];
    
    
    
    [theRequest setHTTPMethod:@"GET"];
    
    [theRequest addValue:@"application/vnd.api+json; version=1" forHTTPHeaderField:@"Accept"];
    [theRequest addValue:@"application/vnd.api+json" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:[NSString stringWithFormat:@"Basic c3NzdGFnaW5nOnNzVDNzdDFuZyE=, Token token=%@", token] forHTTPHeaderField:@"Authorization"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:theRequest
                                     completionHandler:^(NSData *data,
                                                         NSURLResponse *response,
                                                         NSError *error) {
                                         
                                         
                                         if (data == nil) {
                                             NSLog(@"error");
                                         } else {
                                             
                                             
                                             NSDictionary *json_data_response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                             
                                             NSDictionary *dict_data = [json_data_response objectForKey:@"data"];
                                             
                                             NSDictionary *dict_attributes = [dict_data objectForKey:@"attributes"];
                                             
                                             
                                             
                                             for(NSDictionary *dict_details in dict_attributes)
                                             {
                                                
                                                if([dict_details objectForKey:@"userName"])
                                                {
                                                    _label_username.text = [dict_details objectForKey:@"userName"];
                                                }
                                                         
                                                if([dict_details objectForKey:@"name"]) {
                                                    
                                                    _label_name.text = [dict_details objectForKey:@"name"];
                                                }
                                                         
                                                if([dict_details objectForKey:@"description"]) {
                                                    
                                                    _label_description.text = [dict_details objectForKey:@"description"];
                                                }
                                                         
                                                if([dict_details objectForKey:@"suburbName"]) {
                                                    
                                                    _label_suburbName.text = [dict_details objectForKey:@"suburbName"];
                                                    
                                                }
                                                 
                                                 
                                             }
                                             
                                         }
                                         
                                     }] resume];
    
    
}
- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    stringID = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
