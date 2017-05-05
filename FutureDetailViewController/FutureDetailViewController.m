//
//  FutureDetailViewController.m
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "FutureDetailViewController.h"
#import "UIImageView+WebCache.h"

@interface FutureDetailViewController ()

@end

@implementation FutureDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    
    NSString *valueName=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueNameFuture"];
    NSString *valuePrice=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuePriceFuture"];
    NSString *valueImage=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueImageFuture"];
    NSString *valueDate=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueDateFuture"];
    NSString *valueDescription=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuedescriptionFuture"];
    
    NSString *valueStartTimeFuture=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueStartTimeFuture"];
    
    
    
    NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:valueImage];
    
    
    [_imageViewFuture sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    _labelPriceFutureDetail.text=valuePrice;
    _labelFutureDate.text=valueDate;
    _labelFutureDescription.text=valueDescription;
    
    _labelFutureName.text=valueName;
    
    
    _labelFutureName1.text = valueName;
    
    _labelFutureTime.text = valueStartTimeFuture;
    
    [self.viewAllDetail.layer setBorderWidth:0.5];
    
    _viewAllDetail.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    
    NSString *value4=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuelatFuture"];
    NSString *value5=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuelonFuture"];
    
    
    
    
    
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
    
    [self.mapViewFuture setRegion:region];
    [self.mapViewFuture addAnnotation:annotation];
    
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}


- (IBAction)buttonShareAction:(id)sender {
    
    
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
