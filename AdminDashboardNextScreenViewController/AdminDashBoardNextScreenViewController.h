//
//  AdminDashBoardNextScreenViewController.h
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface AdminDashBoardNextScreenViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelNameAdmin;


@property (weak, nonatomic) IBOutlet UILabel *labelDateAdmin;


@property (weak, nonatomic) IBOutlet UILabel *labelPriceAdmin;

@property (weak, nonatomic) IBOutlet UILabel *labelName1;


@property (weak, nonatomic) IBOutlet UILabel *LabelAttendence;


@property (weak, nonatomic) IBOutlet UILabel *labelDescriptionAdmin;

@property (weak, nonatomic) IBOutlet MKMapView *mapKitAdmin;


@property (weak, nonatomic) IBOutlet UIImageView *imageViewAdmin;

@property (strong, nonatomic) IBOutlet UILabel *labelTimeAdmin;

@property (strong, nonatomic) IBOutlet UIView *viewShowdata;


@end
