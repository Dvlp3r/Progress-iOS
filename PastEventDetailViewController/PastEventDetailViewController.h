//
//  PastEventDetailViewController.h
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>


@interface PastEventDetailViewController : UIViewController



@property (weak, nonatomic) IBOutlet UIImageView *imgaeViewPastEvent;


@property (weak, nonatomic) IBOutlet UILabel *labelDatePast;

@property (weak, nonatomic) IBOutlet UILabel *labelPricePast;


@property (weak, nonatomic) IBOutlet UILabel *labelNamePast;
@property (weak, nonatomic) IBOutlet UILabel *labelNamePast1;
@property (weak, nonatomic) IBOutlet UILabel *labelDescriptionPaast;

@property (weak, nonatomic) IBOutlet MKMapView *mapKitPast;

@property (strong, nonatomic) IBOutlet UILabel *labelTimePast;
@property (strong, nonatomic) IBOutlet UIView *viewLoadAllDetails;


@end
