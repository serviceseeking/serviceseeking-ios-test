//
//  MainViewController.m
//  ios-test
//
//  Created by Reggie Cabalo on 25/02/2016.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "MainViewController.h"
NSString *stringID;

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    stringID = [[NSString alloc] init];
    
    array_userName = [[NSMutableArray alloc] init];
    array_name = [[NSMutableArray alloc] init];
    array_ID = [[NSMutableArray alloc] init];
    
    
    NSMutableURLRequest *theRequest=[NSMutableURLRequest
                                     requestWithURL:[NSURL URLWithString:
                                                     @"https://staging.serviceseeking.com.au/leads"]
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
                                             
                                             
                                             
                                             NSArray *responseArray = json_data_response[@"data"];
                                             
                                             for(NSDictionary *dict_response in responseArray)
                                             {
                                                 if([dict_response objectForKey:@"attributes"])
                                                 {
                                                     for(NSDictionary *dict_attributes in dict_response)
                                                     {
                                                         if([dict_attributes objectForKey:@"userName"])
                                                         {
                                                             [array_userName addObject:dict_attributes];
                                                         }
                                                         
                                                         if([dict_attributes objectForKey:@"name"]) {
                                                             [array_name addObject:dict_attributes];
                                                         }
                                                         
                                                     }
                                                     
                                                    
                                                 }
                                                 
                                                 if([dict_response objectForKey:@"id"])
                                                 {
                                                     [array_ID addObject:[dict_response objectForKey:@"id"]];
                                                 }
                                                 
                                             }
                                             
                                         }
                                         
                                     
                                     
                                     
                                     
     }] resume];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    //REG15OCT2014 - checks the state of the tableview
    return array_name.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    tableView.bounces = NO;
    
    [tableView setShowsVerticalScrollIndicator:NO];
    
    static NSString *CellIdentifier = @"TableCell_Lead";
    
    LeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    int row = (int)[indexPath row];
    
    cell.label_username.text = array_userName[row];
    cell.label_name.text = array_name[row];
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    stringID = [array_ID objectAtIndex:indexPath.row];
    
    LeadDetailViewController *leadDetail_VC = [[LeadDetailViewController alloc] init];
    
    [leadDetail_VC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController:leadDetail_VC animated:YES completion:nil];
    
    
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
