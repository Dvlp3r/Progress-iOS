//
//  FutureDetailViewController.h
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>

@interface FutureDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelFutureDate;

@property (weak, nonatomic) IBOutlet UILabel *labelPriceFutureDetail;

@property (weak, nonatomic) IBOutlet MKMapView *mapViewFuture;

@property (weak, nonatomic) IBOutlet UILabel *labelFutureDescription;

@property (weak, nonatomic) IBOutlet UILabel *labelFutureName;

@property (weak, nonatomic) IBOutlet UILabel *labelFutureName1;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewFuture;

@property (strong, nonatomic) IBOutlet UILabel *labelFutureTime;

@property (strong, nonatomic) IBOutlet UIView *viewAllDetail;



@end
