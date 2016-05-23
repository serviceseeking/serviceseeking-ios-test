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

static NSString * const segueIDLeadToLeadDetail = @"leadsToLeadDetail";

@interface LeadsTableViewController ()

@property (strong, nonatomic) NSMutableArray *leadArray;

@end

@implementation LeadsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[API sharedClient] getLeadsListingWithCompletionHandler:^(NSDictionary *responseDictionary) {
        
        NSArray *dataArray = responseDictionary[kData];
        
        for (NSDictionary *dictionary in dataArray) {
            Lead *lead = [[Lead alloc] initWithDataDictionary:dictionary];
            [self.leadArray addObject:lead];
        }
        
        [self reloadTableViewData];
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

- (void)reloadTableViewData {
    dispatch_async(dispatch_get_main_queue(), ^{
       [self.tableView reloadData];
        self.tableView.tableFooterView = [UIView new];
    });
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


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
