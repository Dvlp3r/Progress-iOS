//
//  DashboardCloneTableViewCell.h
//  Events
//
//  Created by Rahul Mehndiratta on 6/22/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardCloneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewEvent;
@property (strong, nonatomic) IBOutlet UIView *vwmain;

@property (weak, nonatomic) IBOutlet UILabel *labelEventName;


@property (weak, nonatomic) IBOutlet UILabel *labelEventAddress;


@property (weak, nonatomic) IBOutlet UILabel *labelEventDate;

@end
