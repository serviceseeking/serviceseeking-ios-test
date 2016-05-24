//
//  LeadsTableViewController.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "LeadsTableViewController.h"
#import "LeadDetailViewController.h"

#import "Lead.h"
#import "User.h"
#import "API+Leads.h"
#import "MBProgressHUD+Loading.h"
#import "ErrorDisplayManager.h"

static NSString * const segueIDLeadToLeadDetail = @"leadsToLeadDetail";
static int pageSize = 6;

@interface LeadsTableViewController ()

@property (strong, nonatomic) NSMutableArray *leadArray;
@property (assign, nonatomic) NSNumber *pageNumber;

@end

@implementation LeadsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    self.pageNumber = @0;
    
    [self fetchLeadListing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Fetch data

- (void)fetchLeadListing {
    [MBProgressHUD showLoadingHUDAddedTo:self.navigationController.view labelText:@"Loading" detailLabelText:@"Please wait . . ."];
    
    self.pageNumber = [NSNumber numberWithInt:[self.pageNumber intValue] + 1];
    
    [[API sharedClient] getLeadsListingWithPageNumber:self.pageNumber pageSize:@(pageSize) successBlock:^(NSDictionary *responseDictionary) {
        
        for (NSDictionary *dictionary in responseDictionary[kData]) {
            Lead *lead = [[Lead alloc] initWithDataDictionary:dictionary];
            [self.leadArray addObject:lead];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
            [self.tableView reloadData];
        });
        
    } failBlock:^(APIError *apiError, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
            (apiError) ? [ErrorDisplayManager displayErrorWithAPIError:apiError inView:self.view] : nil;
            (error) ? [ErrorDisplayManager displayErrorWithNSError:error inView:self.navigationController.view] : nil;
        });
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : self.leadArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accountCellIdentifier" forIndexPath:indexPath];
            cell.imageView.image = [UIImage imageNamed:@"avatar"];
            cell.textLabel.text = [User sharedUserInstance].name;
            cell.detailTextLabel.text = [User sharedUserInstance].email;
            return cell;
        }
            break;
        case 1: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leadCellIdentifier" forIndexPath:indexPath];
            Lead *lead = self.leadArray[indexPath.row];
            cell.textLabel.text = lead.name?: @"";
            cell.detailTextLabel.text = lead.userName ?: @"";
            return cell;
        }
           break;
        default:
            return nil;
            break;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.leadArray.count - 1) {
        [self fetchLeadListing];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:segueIDLeadToLeadDetail]) {
        NSIndexPath *indexPath = (NSIndexPath *)[self.tableView indexPathForCell:sender];
        LeadDetailViewController *vc = segue.destinationViewController;
        
        Lead *lead = self.leadArray[indexPath.row];
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        
        vc.leadID = [formatter numberFromString:lead.ID];
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
