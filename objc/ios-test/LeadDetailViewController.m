//
//  LeadDetailViewController.m
//  ios-test
//
//  Created by Patricia Marie Cesar on 5/23/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "LeadDetailViewController.h"

#import "API.h"
#import "Lead.h"
#import "MBProgressHUD+Loading.h"
#import "NSString+Helper.h"

@interface LeadDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *daysLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *urgentLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *suburbanNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *biddingEndDate;

@end

@implementation LeadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.lead.name;
    
    self.biddingEndDate.text = [NSDateFormatter localizedStringFromDate:[self.lead.biddingClosesOn toDate] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle];
    self.daysLeftLabel.text = [self numberOfDaysAndHoursLeft];
    self.jobNameLabel.text = self.lead.name;
    self.urgentLabel.hidden = !self.lead.isUrgent;
    self.jobDescriptionLabel.text = self.lead.desc;
    self.suburbanNameLabel.text = self.lead.suburbName;
    self.userNameLabel.text = self.lead.userName;
    
//    [MBProgressHUD showLoadingHUDAddedTo:self.view labelText:@"Loading" detailLabelText:@"Please wait . . ."];
//    
//    [[API sharedClient] getLeadWithID:@6 completionHandler:^(NSDictionary *responseDictionary) {
//    
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        });
//    }];
}

#pragma mark - Days and hours remaining

- (NSString *)numberOfDaysAndHoursLeft {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:[NSDate date] toDate:[self.lead.biddingClosesOn toDate] options:0];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
