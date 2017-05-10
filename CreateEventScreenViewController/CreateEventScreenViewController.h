//
//  CreateEventScreenViewController.h
//  Events
//
//  Created by user on 2/11/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CreateEventScreenViewController : UIViewController <UIImagePickerControllerDelegate, UITabBarDelegate, UIActionSheetDelegate, UIScrollViewDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorEvent;

@property (weak, nonatomic) IBOutlet UITextField *textFieldEventName;

@property (weak, nonatomic) IBOutlet UITextField *textFieldEventDescription;


@property (weak, nonatomic) IBOutlet UIImageView *imageViewEventImage;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerView;

@property (weak, nonatomic) IBOutlet UIView *datePickerViewBackground;


@property (weak, nonatomic) IBOutlet UILabel *labelEventDate;

@property (weak, nonatomic) IBOutlet UIButton *buttonEventDate;

@property (weak, nonatomic) IBOutlet UIButton *buttonStartTime;

@property (weak, nonatomic) IBOutlet UILabel *labelStartTime;

@property (weak, nonatomic) IBOutlet UIButton *buttonEndTime;


@property (weak, nonatomic) IBOutlet UILabel *labelEndTime;


@property (weak, nonatomic) IBOutlet UIView *viewstartTimeBackground;


@property (weak, nonatomic) IBOutlet UIView *viewEndTimeBackground;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerStartTime;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerEndTime;


@property (weak, nonatomic) IBOutlet MKMapView *mapViewEventLocation;


@property (weak, nonatomic) IBOutlet UISearchBar *SearchBarLocation;


@property (weak, nonatomic) IBOutlet UILabel *labelSelectLocation;

@property (weak, nonatomic) IBOutlet UIView *viewdatetimeHidder;

@property (weak, nonatomic) IBOutlet UITextField *textFieldSelectPrice;


@property (weak, nonatomic) IBOutlet UITextField *textFieldSelectMaxAttendes;


@property (strong, nonatomic) IBOutlet UIButton *buttonSubmit;

@property (strong, nonatomic) IBOutlet UIButton *buttonCreateEvent;




@property (weak, nonatomic) IBOutlet UITextField *txtEventDate;



@end
