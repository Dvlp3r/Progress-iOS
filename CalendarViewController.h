//
//  CalendarViewController.h
//  Events
//
//  Created by Rahul.Mehndiratta on 6/21/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "FSCalendar.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface CalendarViewController : UIViewController<FSCalendarDataSource, FSCalendarDelegate,FSCalendarDelegateAppearance,UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *baseView;

@property (weak, nonatomic) IBOutlet UITableView *tableViewMenu;
@property (weak, nonatomic) IBOutlet FSCalendar *vwcal;
@end
