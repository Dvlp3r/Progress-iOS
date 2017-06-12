//
//  DashboardNextScreenViewController.h
//  Events
//
//  Created by user on 2/14/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <PassKit/PassKit.h>
#import "BaseVC.h"


@interface DashboardNextScreenViewController : BaseVC<PKPaymentAuthorizationViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *labelEventName;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewEvent;


@property (weak, nonatomic) IBOutlet UILabel *labelDate;


@property (weak, nonatomic) IBOutlet UILabel *labelAmount;

@property (weak, nonatomic) IBOutlet UILabel *labelDescription;

@property (weak, nonatomic) IBOutlet MKMapView *mapViewEvent;

@property (weak, nonatomic) IBOutlet UILabel *labelValueName1;

@property (strong, nonatomic) IBOutlet UIButton *payButtonEvent;



@property (strong, nonatomic) IBOutlet UILabel *labelTime;


@property (strong, nonatomic) IBOutlet UIView *viewAllData;


@end
