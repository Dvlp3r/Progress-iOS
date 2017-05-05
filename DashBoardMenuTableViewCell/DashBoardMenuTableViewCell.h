//
//  DashBoardMenuTableViewCell.h
//  Events
//
//  Created by user on 2/2/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashBoardMenuTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewEvent;

@property (weak, nonatomic) IBOutlet UILabel *labelEventName;


@property (weak, nonatomic) IBOutlet UILabel *labelEventAddress;


@property (weak, nonatomic) IBOutlet UILabel *labelEventDate;



@end
