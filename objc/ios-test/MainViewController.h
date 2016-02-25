//
//  MainViewController.h
//  ios-test
//
//  Created by Reggie Cabalo on 25/02/2016.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

#import "ViewController.h"
#import "LeadTableViewCell.h"
#import "LeadDetailViewController.h"

extern NSString *stringID;

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *array_userName;
    NSMutableArray *array_name;
    NSMutableArray *array_ID;
}

@end
