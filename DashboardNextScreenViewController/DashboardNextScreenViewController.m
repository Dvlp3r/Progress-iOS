//
//  DashboardNextScreenViewController.m
//  Events
//
//  Created by user on 2/14/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "DashboardNextScreenViewController.h"
#import "UIImageView+WebCache.h"
#import "Constant.h"
#import "Model.h"
#import "APIGenerator.h"
#import "CreateEventScreenViewController.h"
#import "AFNetworking.h"
@interface DashboardNextScreenViewController ()

@end

@implementation DashboardNextScreenViewController




- (IBAction)onRSVPClicked:(UIButton *)sender {
    [self bookEvent];
}


- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                       didAuthorizePayment:(PKPayment *)payment
                                completion:(void (^)(PKPaymentAuthorizationStatus status))completion
{
    NSLog(@"Payment was authorized: %@", payment);
    
    // do an async call to the server to complete the payment.
    // See PKPayment class reference for object parameters that can be passed
    BOOL asyncSuccessful = FALSE;
    

    // When the async call is done, send the callback.
    // Available cases are:
    //    PKPaymentAuthorizationStatusSuccess, // Merchant auth'd (or expects to auth) the transaction successfully.
    //    PKPaymentAuthorizationStatusFailure, // Merchant failed to auth the transaction.
    //
    //    PKPaymentAuthorizationStatusInvalidBillingPostalAddress,  // Merchant refuses service to this billing address.
    //    PKPaymentAuthorizationStatusInvalidShippingPostalAddress, // Merchant refuses service to this shipping address.
    //    PKPaymentAuthorizationStatusInvalidShippingContact        // Supplied contact information is insufficient.
    
    if(asyncSuccessful) {
        completion(PKPaymentAuthorizationStatusSuccess);
        
        // do something to let the user know the status
        
        
        [self bookedtoeventApi];

        
        
        NSLog(@"Payment was successful");
        
        //        [Crittercism endTransaction:@"checkout"];
        
    } else {
        completion(PKPaymentAuthorizationStatusFailure);
        
        // do something to let the user know the status
        
        NSLog(@"Payment was unsuccessful");
        
        //        [Crittercism failTransaction:@"checkout"];
    }
    
}

- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller
{
    NSLog(@"Finishing payment view controller");
    
    // hide the payment window
    [controller dismissViewControllerAnimated:TRUE completion:nil];
}




- (IBAction)buttonBuyApplePayAction:(id)sender {
    if([PKPaymentAuthorizationViewController canMakePaymentsUsingNetworks:@[PKPaymentNetworkAmex, PKPaymentNetworkMasterCard, PKPaymentNetworkVisa]]
) {
        
        NSLog(@"Woo! Can make payments!");
        
        
        NSString *valuePrice=[_dicdata valueForKey:@"valuePriceAdmin"];
        
        if ([valuePrice isEqualToString:@"0"]) {
        
        }else{

        
        PKPaymentRequest *request = [[PKPaymentRequest alloc] init];
        
        PKPaymentSummaryItem *widget1 = [PKPaymentSummaryItem summaryItemWithLabel:@"Event"
                                                                            amount:[NSDecimalNumber decimalNumberWithString:valuePrice]];
        
     
        
        PKPaymentSummaryItem *total = [PKPaymentSummaryItem summaryItemWithLabel:@"Grand Total"
                                                                          amount:[NSDecimalNumber decimalNumberWithString:valuePrice]];
        
        request.paymentSummaryItems = @[widget1, total];
        request.countryCode = @"US";
        request.currencyCode = @"USD";
        request.supportedNetworks = @[PKPaymentNetworkAmex, PKPaymentNetworkMasterCard, PKPaymentNetworkVisa];
        request.merchantIdentifier = @"merchant.com.rv.Tech.Events";
        request.merchantCapabilities = PKMerchantCapabilityEMV;
        
        

        PKPaymentAuthorizationViewController *paymentPane = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:request];
            
         paymentPane.delegate = self;
        
//        [self.navigationController pushViewController:paymentPane animated:true];
        
        [self presentViewController:paymentPane animated:TRUE completion:nil];
        
        }
        
        
    } else {
        NSLog(@"This device cannot make payments");
        
        [self callAlert:@"Warning" message:@"This device cannot make payments.Please go to setting and add card"];
        
    
    }

        
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([_strpage isEqualToString:@"detail"]) {
        _btnEdit.hidden = true;
         _btnRSVP.hidden = false;
    }
    else
    {
        NSString *roleAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"role"];
        if ([roleAdmin isEqualToString:@"1"]) {
        _btnEdit.hidden = false;
        }
        _btnRSVP.hidden = true;
         self.navigationItem.title=@"Event Detail";
    }
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:_btnEdit];
    
    // set the nav bar's right button item
    self.navigationItem.rightBarButtonItem = mailbutton;
    NSString *startTime=[_dicdata valueForKey:@"valueStartTimeAdmin"];

    
    NSString *valueName=[_dicdata valueForKey:@"valueNameAdmin"];
    NSString *valueMaxAttend=[_dicdata valueForKey:@"MaxAttendEvent"];
    NSString *valueImage=[_dicdata valueForKey:@"valueImageAdmin"];
    NSString *valueDate=[_dicdata valueForKey:@"valueDateAdmin"];
    NSString *valueDescription=[_dicdata valueForKey:@"valuedescriptionAdmin"];
    
//    NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:valueImage];
//    
//    
//    [_imageViewEvent sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    _lblPrice.text = [NSString stringWithFormat:@"Cost: %@$",[_dicdata valueForKey:@"valuePriceAdmin"]];
    _labelAmount.text=valueMaxAttend;
    _labelDate.text=valueDate;
    _labelDescription.text=valueDescription;
    
    _labelEventName.text=valueName;
    
    
    _labelValueName1.text=valueName;
    
    
    _labelTime.text=startTime;
    
//    [self.viewAllData.layer setBorderWidth:0.5];
//    
//    _viewAllData.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    self.viewAllData.layer.borderColor = [UIColor colorWithRed:(215.0/255.0) green:(215.0/255.0) blue:(215.0/255.0) alpha:1.0].CGColor;
    self.viewAllData.layer.borderWidth = 1.0f;
    
    self.navigationItem.title =@"Event Detail";
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"Back-1"]  ;
    [backBtn setImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 40, 30);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn] ;
    self.navigationItem.leftBarButtonItem = backButton;
    
}
- (void)goback
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    NSString *value4=[_dicdata valueForKey:@"valuelatAdmin"];
    NSString *value5=[_dicdata valueForKey:@"valuelonAdmin"];
    

    
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
    
    [self.mapViewEvent setRegion:region];
    [self.mapViewEvent addAnnotation:annotation];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonAction:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:true];
    
}

-(void)bookEvent{
    
    NSString *eventid = [_dicdata valueForKey:@"valueidAttend"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:eventid forKey:@"event_id"];
   /* AFHTTPRequestOperationManager *manager=[[AFHTTPRequestOperationManager alloc]init];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
NSString *strAccessToken = [Model sharedInstance].accessToken;
    strAccessToken = [NSString stringWithFormat:@"Bearer %@",strAccessToken];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@",strAccessToken] forHTTPHeaderField:@"Authorization"];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [manager POST:[NSString stringWithFormat:@"http://54.209.19.2/api/booktoevent"] parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject %@",responseObject);
        NSDictionary *dictResult = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"dictResult %@",dictResult);
       
        [self stopHudAnimating];
        NSLog(@"%@",  responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [self stopHudAnimating];
     }];
*/
  /*  NSString *strAccessToken = [Model sharedInstance].accessToken;
    strAccessToken = [NSString stringWithFormat:@"Bearer %@",strAccessToken];
    NSDictionary *headers = @{ @"authorization": strAccessToken,
                               @"content-type": @"application/x-www-form-urlencoded"
                               };
    
    NSMutableData *postData = [[NSMutableData alloc] initWithData:[[NSString stringWithFormat:@"event_id=8"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://54.209.19.2/api/booktoevent"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);

                                                        [self showAlert:error.localizedDescription];
                                                        [self stopHudAnimating];

                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                        NSDictionary *dictResult = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                                        NSLog(@"dictResult %@",dictResult);
                                                    }
                                                }];
    [dataTask resume];
    */
    [self executeTask:[APIGenerator bookEvent:dict]];
}

-(BOOL)onSuccess:(id)object forRT:(NSString *)rt andParamObject:(HttpObject *)params{
    [self onBookEventResponseReceived:object];
    

    return YES;
}

-(void)onBookEventResponseReceived:(NSDictionary *)json{
    if(json != nil){
        NSString *msg = [json objectForKey:@"message"];
        NSString *error = [json objectForKey:@"error"];
        if(error == nil && [@"success" isEqualToString:msg]){
            [self showAlert:@"Event booked successfully"];
        }else if(error != nil){
            if ([error isEqualToString:@"already booked this event"]) {
                [self showAlert:error];

            }
            else
            {
                [self showAlert:@"Something went wrong.Please try again."];

            }
        }
    }
}

-(void)onFailure:(HttpObject *)paramObject forRT:(NSString *)rt{
    
}

-(void)bookedtoeventApi {
    
    //    _indicatorLogin.hidden=NO;
    //    [_indicatorLogin startAnimating];
    
    
    NSString *eventid = [_dicdata valueForKey:@"valueidAttend"];
    
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    
    NSString *strBearer = @"Bearer ";
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,booktoevent];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
        NSString *event_id = @"event_id=";
    //
    //    NSString *password_ = @"&password=";
    //
        NSString *concatenate1 = [event_id stringByAppendingString:eventid];
    //
    //    NSString *concatenate2 = [password_ stringByAppendingString:password];
    //
    //    NSString *concatenate3 = [concatenate1 stringByAppendingString:concatenate2];
    
    
    //NSString *post = [URL stringByAppendingString:stringWithoutSpaces];
    
        NSData *postData = [concatenate1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        
        //        [_indicatorLogin stopAnimating];
        //        _indicatorLogin.hidden=YES;
        
        
        if(data!=nil){
            
            
            NSError *jsonError;
            
            NSData *objectData = [noti dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            NSLog(@"%@",json);
            
            NSArray *Data = [json objectForKey:@"Data"];
            
            
            
            
            //            if (errors!=nil) {
            //
            //
            //                [self callAlert:@"Warning" message:@"Incorrect username or password"];
            //
            //
            //            }
            
            //            else{
            
            //                [Model sharedInstance].accessToken= [json objectForKey:@"access_token"];
            //
            //                NSLog(@"access token %@",[Model sharedInstance].accessToken);
            //
            //                NSArray *valueData = [json objectForKey:@"user"];
            //
            //                NSLog(@"%@ data",valueData);
            //
            //                NSArray *username1=[valueData valueForKey:@"username"];
            //
            //                NSString *contact=[valueData valueForKey:@"contact"];
            //
            //                NSString *email1=[valueData valueForKey:@"email"];
            //
            //                //   [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(setButtonEnabled) userInfo:nil repeats:NO];
            //
            //
            //                [[NSUserDefaults standardUserDefaults]setObject:username1 forKey:@"username1"];
            //
            //                //   [[NSUserDefaults standardUserDefaults]setObject:_textFieldPassword.text forKey:@"Password"];
            //
            //                [[NSUserDefaults standardUserDefaults]setObject:contact forKey:@"contact"];
            //
            //                [[NSUserDefaults standardUserDefaults]setObject:email1 forKey:@"email"];
            //                [[NSUserDefaults standardUserDefaults]synchronize];
            //
            //                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //
            //                UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
            //
            //                [self.navigationController pushViewController:vc animated:YES];
            //
            
            //                __textFieldUserNameLogin.text=nil;
            //                
            //                __textFieldPasswordLogin.text=nil;
            
            //  }
        }
    }];
}


-(void)callAlert:(NSString *)Title message:(NSString *)Message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction  = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)shareButtonAction:(id)sender {
    
    
    
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


- (IBAction)EditAction:(id)sender {
    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"Createventdataedit"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CreateEventScreenViewController *init4inchViewController = [str instantiateViewControllerWithIdentifier:@"CreateEventScreenViewController"];
    init4inchViewController.strpage = @"edit";
    init4inchViewController.dicdata = _dicdata;
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.navigationController pushViewController:init4inchViewController animated:NO];

}
@end
