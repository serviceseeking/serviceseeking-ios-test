//
//  LeadsTableViewController.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "LeadsTableViewController.h"
#import "LeadDetailViewController.h"

#import "API.h"
#import "Keys.h"
#import "Lead.h"

#import "MBProgressHUD+Loading.h"

static NSString * const segueIDLeadToLeadDetail = @"leadsToLeadDetail";

@interface LeadsTableViewController ()

@property (strong, nonatomic) NSMutableArray *leadArray;

@end

@implementation LeadsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MBProgressHUD showLoadingHUDAddedTo:self.view labelText:@"Loading" detailLabelText:@"Please wait . . ."];
    
    [[API sharedClient] getLeadsListingWithCompletionHandler:^(NSDictionary *responseDictionary) {
        NSArray *dataArray = responseDictionary[kData];
        
        for (NSDictionary *dictionary in dataArray) {
            Lead *lead = [[Lead alloc] initWithDataDictionary:dictionary];
            [self.leadArray addObject:lead];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            [self.tableView reloadData];
            self.tableView.tableFooterView = [UIView new];
        });
    }];
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.leadArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leadCellIdentifier" forIndexPath:indexPath];
    
    Lead *lead = self.leadArray[indexPath.row];
    cell.textLabel.text = lead.name?: @"";
    cell.detailTextLabel.text = lead.userName ?: @"";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:segueIDLeadToLeadDetail]) {
        NSIndexPath *indexPath = (NSIndexPath *)[self.tableView indexPathForCell:sender];
        LeadDetailViewController *vc = segue.destinationViewController;
        vc.lead = self.leadArray[indexPath.row];
    }
}

#pragma mark - Lazy loading of property/ies

- (NSMutableArray *)leadArray {
    
    if (!_leadArray) {
        _leadArray = [[NSMutableArray alloc] init];
    }
    return _leadArray;
}

@end
