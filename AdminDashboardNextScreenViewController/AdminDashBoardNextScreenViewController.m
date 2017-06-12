//
//  AdminDashBoardNextScreenViewController.m
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AdminDashBoardNextScreenViewController.h"
#import "UIImageView+WebCache.h"
#import "AttendUserViewController.h"
#import "CreateEventScreenViewController.h"
#import "Model.h"

#import "Constant.h"

@interface AdminDashBoardNextScreenViewController ()


@end

@implementation AdminDashBoardNextScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // add another button
    
    // now create a Bar button item
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:_btnEdit];
    
    // set the nav bar's right button item
    self.navigationItem.rightBarButtonItem = mailbutton;
    // Do any additional setup after loading the view.
    
    [self.viewShowdata.layer setBorderWidth:0.5];
    
    _viewShowdata.layer.borderColor=[[UIColor lightGrayColor]CGColor];

    
    NSString *valueName=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueNameAdmin"];
    NSString *valuePrice=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuePriceAdmin"];
    NSString *valueImage=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueImageAdmin"];
    NSString *valueDate=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueDateAdmin"];
    NSString *valueDescription=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuedescriptionAdmin"];
    
    
    
    NSString *valueStartTimeAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueStartTimeAdmin"];

    
    NSString *valueTotalAteend=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueTotalAttend"];

    
    NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:valueImage];
    
    
    [_imageViewAdmin sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    _labelPriceAdmin.text=valuePrice;
    _labelDateAdmin.text=valueDate;
    _labelDescriptionAdmin.text=valueDescription;
    
    _labelName1.text=valueName;
    
    
    _labelNameAdmin.text=valueName;
    
    _LabelAttendence.text=valueTotalAteend;
    
    _labelTimeAdmin.text=valueStartTimeAdmin;
    
    self.title =@"Progress";
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    NSString *value4=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuelatAdmin"];
    
    NSString *value5=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuelonAdmin"];
    
    
    double value=[value4 floatValue];
    double value2=[value5 floatValue];
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = value;
    zoomLocation.longitude= value2;
    if (value > 90 ) {
        value = 85;
    }
    else if (value < -90 ) {
        value = -85;
    }

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
    
    [self.mapKitAdmin setRegion:region];
    [self.mapKitAdmin addAnnotation:annotation];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonBackAction:(id)sender {
    
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"Createventdataedit"];
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (IBAction)buttonTotalAttendenceAction:(id)sender {
    
    
 //   [self AttendApi];
    NSLog(@"jhj");
    
    NSString *valueTotalAteend=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueTotalAttend"];

    
    if ([valueTotalAteend isEqualToString:@"0"]) {
        
    }else{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *init4inchViewController = [storyBoard instantiateViewControllerWithIdentifier:@"AttendUserViewController"];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.navigationController pushViewController:init4inchViewController animated:NO];
        
        
    }
    
}

- (IBAction)buttonEditAction:(id)sender {
    
    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"Createventdataedit"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *init4inchViewController = [str instantiateViewControllerWithIdentifier:@"CreateEventScreenViewController"];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.navigationController pushViewController:init4inchViewController animated:NO];
    
    
    
    
}


- (IBAction)buttonShare:(id)sender {
    
    
    
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
