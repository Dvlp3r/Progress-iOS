//
//  MyEventCreateViewController.h
//  Events
//
//  Created by user on 2/13/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyEventCreateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableViewMyEvent;


@property (weak, nonatomic) IBOutlet UIButton *buttonFutureEvents;


@property (weak, nonatomic) IBOutlet UIButton *buttonPastEvent;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITableView *tabloeViewPastEvent;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewMyEvent;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewBackground;

@property (strong, nonatomic) IBOutlet UIView *viewonImage;

@property (strong, nonatomic) IBOutlet UILabel *labelUserNameEvent;

@property (strong, nonatomic) IBOutlet UILabel *labelAddress;



@end
