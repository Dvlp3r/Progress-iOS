//
//  CalendarViewController.h
//  Events
//
//  Created by Rahul.Mehndiratta on 6/21/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "FSCalendar.h"

@interface CalendarViewController : UIViewController<FSCalendarDataSource, FSCalendarDelegate,FSCalendarDelegateAppearance,UITableViewDelegate,UITableViewDataSource>
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
@property (weak, nonatomic) IBOutlet FSCalendar *vwcal;
@property (weak, nonatomic) IBOutlet UIButton *btnsetting;
@end
