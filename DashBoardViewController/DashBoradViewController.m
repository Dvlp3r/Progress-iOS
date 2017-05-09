//Main Page After Login
//  DashBoradViewController.m
//  Events
//
//  Created by user on 2/2/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "DashBoradViewController.h"
#import "DashBoardMenuTableViewCell.h"
#import "FirstScreenViewController.h"
#import "ProfileAccountViewController.h"
#import "CreateEventScreenViewController.h"
#import "Constant.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
#import "MyEventCreateViewController.h"
#import "DashboardNextScreenViewController.h"

#import "ViewController.h"
#import "LoginViewViewControllers.h"


@interface DashBoradViewController ()
{
    
    NSMutableArray *arrayNameEvent;
    NSMutableArray *arrayAddressEvent;
    NSMutableArray *arrayPicEvent;
    NSMutableArray *arrayDateEvent;
    NSMutableArray *arrayStartTimeEvent;
    NSMutableArray *arrayEndTimeEvent;
    NSMutableArray *arrayDescriptionEvent;
    NSMutableArray *arrayPriceEvent;
    NSMutableArray *arrayidMain;
    
    NSMutableArray *arraylatEvent;
    
    NSMutableArray *arraymaxAttendevent;
    
    NSMutableArray *arraylongEvent;


    NSMutableArray *arrayName;
    
    
    int x1;
    
}
@end

@implementation DashBoradViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    _baseView.hidden=YES;
    
    arrayName =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",nil];
    
    arrayNameEvent =[[NSMutableArray alloc]init];
    
    arraymaxAttendevent = [[NSMutableArray alloc]init];
    
    arrayPicEvent =[[NSMutableArray alloc]init];
    
    arrayAddressEvent =[[NSMutableArray alloc]init];
    
    arrayDateEvent =[[NSMutableArray alloc]init];

    arrayStartTimeEvent =[[NSMutableArray alloc]init];

    arrayEndTimeEvent =[[NSMutableArray alloc]init];
    
    arrayDescriptionEvent=[[NSMutableArray alloc]init];

    arrayPriceEvent=[[NSMutableArray alloc]init];
    
    arrayidMain=[[NSMutableArray alloc]init];
    
    arraylatEvent =[[NSMutableArray alloc]init];
    
    arraylongEvent =[[NSMutableArray alloc]init];
    
    
    x1=0;
    
   [self eventgetAllApi];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}


-(void) viewWillAppear:(BOOL)animated{
    


}


- (IBAction)buttonMenuAction:(id)sender {
    
//    if (_baseView.hidden==YES) {
//        
//        _baseView.hidden=NO;
//        
//        CGRect initalFrame = self.baseView.frame;
//        initalFrame.origin.x = -initalFrame.size.width;
//        self.baseView.frame = initalFrame;
//        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLefttoRight:) userInfo:@1 repeats:NO];
//        
//       
////        
////        [UIView animateWithDuration:0.5
////                              delay:1.0
////                            options: UIViewAnimationCurveEaseOut
////                         animations:^{
////                             self.baseView.frame = CGRectMake(115, self.baseView.frame.origin.y, self.baseView.frame.size.width-30, self.baseView.frame.size.height);
////                         }
////                         completion:^(BOOL finished){
////                             NSLog(@"Moved to left!");
////                         }];
//        
//        
//        
//        
//    }else{
//        
////        _baseView.hidden=YES;
//        
//        
//        
////        CGRect initalFrame = self.baseView.frame;
////        initalFrame.origin.x = -initalFrame.size.width;
////        self.baseView.frame = initalFrame;
////        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromrightToLeft:) userInfo:@1 repeats:NO];
//        
//        [UIView animateWithDuration:0.5
//                              delay:1.0
//                            options: UIViewAnimationCurveEaseOut
//                         animations:^{
//                             self.baseView.frame = CGRectMake(0, self.baseView.frame.origin.y, 0, self.baseView.frame.size.height);
//                         }
//                         completion:^(BOOL finished){
//                             
//                             _baseView.hidden=YES;
//
//                             NSLog(@"Back to normal!");
//                         }];
//        
//        
//        
//    }
//    

    
    
    
    if (x1==0) {
        [UIView animateWithDuration:0.4 animations:^{
            _baseView.frame=CGRectMake(0,self.baseView.frame.origin.y,self.baseView.frame.size.width,self.baseView.frame.size.height);
//            _transperant_view.frame=CGRectMake(0,self.transperant_view.frame.origin.y,self.transperant_view.frame.size.width,self.transperant_view.frame.size.height);
//            _transperant_view.hidden=NO;
            _baseView.hidden=NO;
            NSLog(@"left");
            
        }];
        
        
        x1=1;
    }
    else{
        NSLog(@"heyy%d",x1);
        [UIView animateWithDuration:0.4 animations:^{
            _baseView.frame=CGRectMake(-417,self.baseView.frame.origin.y,self.baseView.frame.size.width,self.baseView.frame.size.height);
//            _transperant_view.frame=CGRectMake(-500,self.transperant_view.frame.origin.y,self.transperant_view.frame.size.width,self.transperant_view.frame.size.height);
            
            
//            _transperant_view.hidden=YES;
            NSLog(@"right");
        }];
        x1=0;
    }
    

    
}


//-(void)moveFromrightToLeft:(NSTimer *) timer {
//
//
//    BOOL isLeft = [timer.userInfo boolValue];
//    CGFloat bounceDistance = 1;
//    CGFloat bounceDuration = 0.1;
//    [UIView animateWithDuration:0.3f
//                          delay:0.0f
//                        options:UIViewAnimationOptionAllowAnimatedContent
//                     animations:^{
//                         CGFloat direction = (isLeft ? -1 : 1);
//                         self.baseView.frame = CGRectMake(0.0,_baseView.frame.origin.y, self.baseView.frame.size.width,self.baseView.frame.size.height);}
//                     completion:^(BOOL finished){
//                         [UIView animateWithDuration:bounceDuration animations:^{
//                             self.baseView.center = CGPointMake(self.baseView.frame.size.width/2, self.baseView.center.y);
//                             
//                           //  _baseView.hidden=YES;
//                             
//                             
//                         }];
//                     }];
//
//}





-(void)moveFromLefttoRight:(NSTimer *) timer {
    BOOL isLeft = [timer.userInfo boolValue];
    CGFloat bounceDistance = 10;
    CGFloat bounceDuration = 0.1;
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         CGFloat direction = (isLeft ? 1 : -1);
                         self.baseView.center = CGPointMake(self.baseView.frame.size.width/2 + direction*bounceDistance, self.baseView.center.y);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:bounceDuration animations:^{
                             self.baseView.center = CGPointMake(self.baseView.frame.size.width/2, self.baseView.center.y);
                         }];
                     }];
}




# pragma mark TableView Data source and delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return [arrayNameEvent count];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"DashBoardMenuTableViewCell";
    
    DashBoardMenuTableViewCell *cell = (DashBoardMenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        //        cell = [[FeaturedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        cell = (DashBoardMenuTableViewCell *)[nib objectAtIndex:0];
        
    }
    
    //cell.imageViewEvent.image=[ev]
    
//    NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:[arrayPicEvent objectAtIndex:indexPath.row]];
//    
//    
//    [cell.imageViewEvent sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    cell.labelEventName.text=[arrayNameEvent objectAtIndex:indexPath.row];
    
    cell.labelEventAddress.text=[arrayAddressEvent objectAtIndex:indexPath.row];
    
    cell.labelEventDate.text=[arrayDateEvent objectAtIndex:indexPath.row];
    
    
    
    //    if (!isFiltered) {
    
//    cell.labelFriendList.text=[arrayName objectAtIndex:indexPath.row];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 179;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    NSArray *valueName=[arrayNameEvent objectAtIndex:indexPath.row];
    NSArray *valueAddress=[arrayAddressEvent objectAtIndex:indexPath.row];
    NSArray *valueImage=[arrayPicEvent objectAtIndex:indexPath.row];
    NSArray *valueDate=[arrayDateEvent objectAtIndex:indexPath.row];
    
    NSArray *valueDescription=[arrayDescriptionEvent objectAtIndex:indexPath.row];
    NSArray *valuePrice=[arrayPriceEvent objectAtIndex:indexPath.row];
    
    

    NSArray *valueidMain=[arrayidMain objectAtIndex:indexPath.row];

       NSArray *valuelat=[arraylatEvent objectAtIndex:indexPath.row];
    
    
    NSArray *valuelon=[arraylongEvent objectAtIndex:indexPath.row];
    
    NSArray *startTime=[arrayStartTimeEvent objectAtIndex:indexPath.row];
    
    
    NSArray *maxAttend=[arraymaxAttendevent objectAtIndex:indexPath.row];
    
    [[NSUserDefaults standardUserDefaults]setObject:maxAttend forKey:@"maxAttend"];
    
    [[NSUserDefaults standardUserDefaults]setObject:startTime forKey:@"startTime"];
    
    
    
    [[NSUserDefaults standardUserDefaults]setObject:valuelat forKey:@"valuelat"];
    
    [[NSUserDefaults standardUserDefaults]setObject:valuelon forKey:@"valuelon"];
    
    
    [[NSUserDefaults standardUserDefaults]setObject:valueidMain forKey:@"valueidMain"];

    [[NSUserDefaults standardUserDefaults]setObject:valueName forKey:@"valueName"];
    
    [[NSUserDefaults standardUserDefaults]setObject:valuePrice forKey:@"valuePrice"];

    
    
    [[NSUserDefaults standardUserDefaults]setObject:valueAddress forKey:@"valueAddress"];
    
    
    [[NSUserDefaults standardUserDefaults]setObject:valueImage forKey:@"valueImage"];
    
    
    [[NSUserDefaults standardUserDefaults]setObject:valueDate forKey:@"valueDate"];
    
    
    [[NSUserDefaults standardUserDefaults]setObject:valueDescription forKey:@"valueDescription"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
//    NSArray *valueLat=[latArray3 objectAtIndex:indexPath.row];
//    NSArray *valueLong=[longitudeArray3 objectAtIndex:indexPath.row];
//    
//    NSArray *valueCity=[cityArray3 objectAtIndex:indexPath.row];
//    NSArray *valueDescription=[descriptionArray3 objectAtIndex:indexPath.row];
    
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *init4inchViewController = [storyBoard instantiateViewControllerWithIdentifier:@"DashboardNextScreenViewController"];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.navigationController pushViewController:init4inchViewController animated:NO];
    
    
    
    
}


- (IBAction)buttonLogOutAction:(id)sender {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
//    LoginViewViewControllers *obj  = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewViewControllers"];
//    [self.navigationController presentViewController:obj animated:true completion:nil];
    
}


- (IBAction)buttonEventsAction:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)buttonMyEventsAction:(id)sender {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MyEventCreateViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

//- (IBAction)buttonCreateEventAction:(id)sender {
//    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CreateEventScreenViewController"];
//    
//    [self.navigationController pushViewController:vc animated:YES];
//    
//    
//}



- (IBAction)buttonProfileAccountAction:(id)sender {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ProfileAccountViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}





-(void)eventgetAllApi {
    
//    _indicatorLogin.hidden=NO;
//    [_indicatorLogin startAnimating];
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,getallevents];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
//    NSString *username_ = @"username=";
//    
//    NSString *password_ = @"&password=";
//    
//    NSString *concatenate1 = [username_ stringByAppendingString:email];
//    
//    NSString *concatenate2 = [password_ stringByAppendingString:password];
//    
//    NSString *concatenate3 = [concatenate1 stringByAppendingString:concatenate2];
    
    
    //NSString *post = [URL stringByAppendingString:stringWithoutSpaces];
    
//    NSData *postData = [@"" dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    [theRequest setHTTPBody:postData];
    
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
            
            
            NSArray *allData=[Data valueForKey:@"data"];
            
            for (int i=0; i < allData.count; i++) {
                
                NSDictionary *dict=[allData objectAtIndex:i];
                
                NSArray *nameEvent=[dict valueForKey:@"name"];
                NSString *addressEvent=[dict valueForKey:@"address"];
                NSString *eventdate=[dict valueForKey:@"event_date"];
                
                NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
                dateFormatter.dateFormat = @"yyyy-MM-dd";
                NSDate *yourDate = [dateFormatter dateFromString:eventdate];
                dateFormatter.dateFormat = @"dd-MMM-yyyy";
                
                NSString *eventDateCorrectFormate= [NSString stringWithFormat:@"%@",
                                                    [dateFormatter stringFromDate:yourDate]];
                
                NSString *eventpic=[dict valueForKey:@"event_pic"];
                NSString *starttime=[dict valueForKey:@"start_time"];
                NSString *endtime=[dict valueForKey:@"end_time"];
                
                NSString *idMain= [NSString stringWithFormat:@"%@",[ dict valueForKey:@"id"]];
                
                NSLog(@"idmain %@",idMain);
                
                NSString *description=[dict valueForKey:@"description"];
                
                NSString *price=[dict valueForKey:@"price"];
                
                NSString *maxAttend =[NSString stringWithFormat:@"%@", [dict valueForKey:@"max_attend"]];
                
                
                NSString *lat=[dict valueForKey:@"latitude"];
                
                NSString *lon=[dict valueForKey:@"longitude"];

                
                [arrayNameEvent addObject:nameEvent];
                [arrayAddressEvent addObject:addressEvent];
                [arrayDateEvent addObject:eventDateCorrectFormate];
                [arrayPicEvent addObject:eventpic];
                [arrayStartTimeEvent addObject:starttime];
                [arrayEndTimeEvent addObject:endtime];
                [arrayDescriptionEvent addObject:description];
                [arrayPriceEvent addObject:price];
                [arrayidMain addObject:idMain];
                
                [arraylatEvent addObject:lat];
                
                [arraylongEvent addObject: lon];
                
                [arraymaxAttendevent addObject:maxAttend];
                
             }
            
            [_tableViewMenu reloadData];
   
            
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



- (IBAction)buttonSupportAction:(id)sender {
    
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@""];
        [mailViewController setMessageBody:@"" isHTML:NO];
        
        NSArray *toRecipients = [NSArray arrayWithObject:@"sean@dvlper.com"];
                                 // (NSString *) [feed valueForKey:@"email"]];
        [mailViewController setToRecipients:toRecipients];
        
        [self presentModalViewController:mailViewController animated:YES];
        
    }
    
    else {
        
        NSLog(@"Device is unable to send email in its current state.");
        
    }
    
  //  [self callAlert:@"Email" message:@"sean@dvlper.com"];
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    // switchng the result
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled.");
            /*
             Execute your code for canceled event here ...
             */
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved.");
            /*
             Execute your code for email saved event here ...
             */
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent.");
            /*
             Execute your code for email sent event here ...
             */
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail send error: %@.", [error localizedDescription]);
            /*
             Execute your code for email send failed event here ...
             */
            break;
        default:
            break;
    }
    // hide the modal view controller
    [self dismissModalViewControllerAnimated:YES];
}

@end
