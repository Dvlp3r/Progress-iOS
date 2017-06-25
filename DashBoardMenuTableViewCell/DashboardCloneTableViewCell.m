//
//  DashboardCloneTableViewCell.m
//  Events
//
//  Created by Rahul Mehndiratta on 6/22/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "DashboardCloneTableViewCell.h"
#import "PastEventTableViewCell.h"
@implementation DashboardCloneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [PastEventTableViewCell setShadowView:_vwmain];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
