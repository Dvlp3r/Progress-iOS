//
//  AdminDashboardViewController.h
//  Events
//
//  Created by user on 2/14/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface AdminDashboardViewController : UIViewController<MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *buttonEvent;

@property (weak, nonatomic) IBOutlet UIButton *buttonUser;

@property (weak, nonatomic) IBOutlet UIButton *buttonFilter;

@property (weak, nonatomic) IBOutlet UIButton *buttonMenu;

@property (weak, nonatomic) IBOutlet UITableView *tableViewAdminDashboard;

@property (weak, nonatomic) IBOutlet UIView *viewMenuDashBoard;


@property (weak, nonatomic) IBOutlet UITableView *tableViewUser;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *labelEventToday;


@property (weak, nonatomic) IBOutlet UILabel *labelEventThisWeek;


@property (weak, nonatomic) IBOutlet UILabel *labelEventThisMonth;

@property (weak, nonatomic) IBOutlet UILabel *labelEventThisYear;


@property (weak, nonatomic) IBOutlet UIView *viewDone;

@property (weak, nonatomic) IBOutlet UIButton *buttonDone;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewEvent;


@property (strong, nonatomic) IBOutlet UIView *viewEventUser;


@property (strong, nonatomic) IBOutlet UIImageView *imageViewDeletePopUp;

@property (strong, nonatomic) IBOutlet UILabel *labelMessagePop;
@property (strong, nonatomic) IBOutlet UIButton *okbutton;
@property (strong, nonatomic) IBOutlet UIView *customViewPopUp;


@end
