//
//  AdminDashboardTableViewCell.m
//  Events
//
//  Created by user on 2/14/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AdminDashboardTableViewCell.h"
#import "PastEventTableViewCell.h"

@implementation AdminDashboardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [PastEventTableViewCell setShadowView:self.vw];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
