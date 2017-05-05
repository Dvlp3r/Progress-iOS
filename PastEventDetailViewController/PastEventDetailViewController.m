//
//  PastEventDetailViewController.m
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "PastEventDetailViewController.h"

#import "UIImageView+WebCache.h"


@interface PastEventDetailViewController ()

@end

@implementation PastEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *valueName=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueNamePast"];
    NSString *valuePrice=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuePricePast"];
    NSString *valueImage=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueImagePast"];
    NSString *valueDate=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueDatePast"];
    NSString *valueDescription=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuedescriptionPast"];
    
        NSString *valueStartTimePast=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueStartTimePast"];
    
    NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:valueImage];
    
    
    [_imgaeViewPastEvent sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    _labelPricePast.text=valuePrice;
    
    _labelDatePast.text=valueDate;
    
    _labelDescriptionPaast.text=valueDescription;
    
    _labelNamePast.text=valueName;
    
    _labelNamePast1.text=valueName;
    
    _labelTimePast.text=valueStartTimePast;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    
   
    
    
    NSString *value4=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuelatPast"];
    NSString *value5=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuelonPast"];
    
    
    
    
    
    double value=[value4 floatValue];
    double value2=[value5 floatValue];
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = value;
    zoomLocation.longitude= value2;
    
    // 2
    //    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    //
    //    // 3
    //    [_mapKitObject setRegion:viewRegion animated:YES];
    
    
    
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(value, value2);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = {coord, span};
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coord];
    
    [self.mapKitPast setRegion:region];
    [self.mapKitPast addAnnotation:annotation];
    

    
}
- (IBAction)buttonBackAction:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:true];
    
    
}


- (IBAction)buttonshareUploadAction:(id)sender {
    
    
    NSArray *objectsToShare = @[@""];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];
    
    
}





@end
