//
//  PastEventTableViewCell.h
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastEventTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewPastEvents;
@property (weak, nonatomic) IBOutlet UILabel *labelTitleNamePast;

@property (weak, nonatomic) IBOutlet UIView *cardView;
-(void)setCardView;
+(void)setShadowView:(UIView *)shadowView;
@property (weak, nonatomic) IBOutlet UILabel *labelDatePastEvent;


@property (weak, nonatomic) IBOutlet UILabel *labelTimePast;
@property (strong, nonatomic) IBOutlet UILabel *labelAddressPast;



@end
