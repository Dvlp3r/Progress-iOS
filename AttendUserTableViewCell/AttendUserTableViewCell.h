//
//  AttendUserTableViewCell.h
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttendUserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelUserNamecell;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewCell;

@property (weak, nonatomic) IBOutlet UIButton *buttonMarkAsRead;


@property (weak, nonatomic) IBOutlet UIButton *buttonMarkAsUnread;





@end
