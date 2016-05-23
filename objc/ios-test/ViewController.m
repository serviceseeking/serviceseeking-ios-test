//
//  ViewController.m
//  ios-test
//
//  Created by Justine on 19/01/2016.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "ViewController.h"
#import "API.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[API sharedClient] loginWithUsername:@"test_business@serviceseeking.com.au" password:@"123123" completionHandler:^(NSDictionary *responseDictionary) {
       
        [[API sharedClient] getLeadsListingWithCompletionHandler:^(NSDictionary *responseDictionary) {
            
        }];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
