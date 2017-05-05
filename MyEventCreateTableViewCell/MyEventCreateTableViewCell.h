//
//  MyEventCreateTableViewCell.h
//  Events
//
//  Created by user on 2/13/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyEventCreateTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewMyEvent;

@property (weak, nonatomic) IBOutlet UILabel *labelMyEventName;



@property (weak, nonatomic) IBOutlet UILabel *labelMyEventDate;

@property (weak, nonatomic) IBOutlet UILabel *labelEventTime;

@property (strong, nonatomic) IBOutlet UILabel *labelAMyEventddress;

@end
