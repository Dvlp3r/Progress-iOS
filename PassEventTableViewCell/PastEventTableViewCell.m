//
//  PastEventTableViewCell.m
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "PastEventTableViewCell.h"

@implementation PastEventTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setCardView];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:false animated:animated];
    // Configure the view for the selected state
}

-(void)setCardView{
    [PastEventTableViewCell setShadowView:self.cardView];
}

+(void)setShadowView:(UIView *)shadowView{
//    shadowView.backgroundColor=[UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:0.5];
    [shadowView.layer setCornerRadius:2.0f];
    [shadowView.layer setBorderColor:[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0].CGColor];
    [shadowView.layer setBorderWidth:1.0f];
    [shadowView.layer setShadowColor:[UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1.0].CGColor];
    [shadowView.layer setShadowOpacity:1.0];
    [shadowView.layer setShadowRadius:0.2];
    [shadowView.layer setShadowOffset:CGSizeMake(0.2f, 0.2f)];
}

@end
