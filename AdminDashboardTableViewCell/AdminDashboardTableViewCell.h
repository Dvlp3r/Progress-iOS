//
//  AdminDashboardTableViewCell.h
//  Events
//
//  Created by user on 2/14/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminDashboardTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageViewAdmineEvent;

@property (weak, nonatomic) IBOutlet UILabel *labelAdminEventName;

@property (weak, nonatomic) IBOutlet UILabel *labelAdminEventRate;


@property (weak, nonatomic) IBOutlet UILabel *labelAdminEventDate;

@property (strong, nonatomic) IBOutlet UILabel *labelAdminEventAddress;


@end
