//
//  LeadDetailViewController.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "LeadDetailViewController.h"

#import "Lead.h"
#import "API+Leads.h"
#import "MBProgressHUD+Loading.h"
#import "NSString+Helper.h"

@interface LeadDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *daysLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *isUrgentLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *suburbanNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *biddingEndDate;
@property (weak, nonatomic) IBOutlet UILabel *isNewLabel;

@end

@implementation LeadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MBProgressHUD showLoadingHUDAddedTo:self.navigationController.view labelText:@"Loading" detailLabelText:@"Please wait . . ."];
    
    [[API sharedClient] getLeadWithID:self.leadID completionHandler:^(NSDictionary *responseDictionary) {
        
        Lead *lead = [[Lead alloc] initWithDataDictionary:responseDictionary[kData]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateInfoWithLead:lead];
            [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
        });
    }];
}

#pragma mark - UI

- (void)updateInfoWithLead:(Lead *)lead {
    self.biddingEndDate.text = [NSString stringWithFormat:@"Bidding closes on: %@", [NSDateFormatter localizedStringFromDate:[lead.biddingClosesOn toDate] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle]];
    self.daysLeftLabel.text = [self numberOfDaysAndHoursLeft:[lead.biddingClosesOn toDate]];
    self.jobNameLabel.text = lead.name;
    self.isUrgentLabel.hidden = !lead.isUrgent;
    self.isNewLabel.hidden = !lead.isNew;
    self.jobDescriptionLabel.text = lead.desc;
    self.suburbanNameLabel.text = lead.suburbName;
    self.userNameLabel.text = lead.userName;
}

#pragma mark - Days and hours remaining

- (NSString *)numberOfDaysAndHoursLeft:(NSDate *)date {
    
    if (date != nil) {
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:[NSDate date] toDate:date options:0];
        NSInteger days = components.day;
        NSInteger hours = days % 24;
        
        NSMutableString *daysRemaining = [[NSMutableString alloc] init];
        
        if (days > 0) {
            [daysRemaining appendFormat:@"%ld day", (long)days];
            
            if (days > 1) {
                [daysRemaining appendString:@"s"];
            }
        }
        if (hours > 0) {
            [daysRemaining appendFormat:@" %ld hour", (long)hours];
            
            if (hours > 1) {
                [daysRemaining appendString:@"s"];
            }
        }
        return daysRemaining.copy;
    }
    return @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
