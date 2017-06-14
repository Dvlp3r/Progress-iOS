//
//  MyEventCreateViewController.m
//  Events
//
//  Created by user on 2/13/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "MyEventCreateViewController.h"
#import "MyEventCreateTableViewCell.h"
#import "Constant.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
#import "DashBoradViewController.h"
#import "AdminDashboardViewController.h"
#import "FutureDetailViewController.h"
#import "PastEventTableViewCell.h"
#import "PastEventDetailViewController.h"
#import "AdminDashBoardNextScreenViewController.h"
#import "ProfileAccountViewController.h"
#import "DashboardNextScreenViewController.h"

@interface MyEventCreateViewController ()

{
        NSMutableArray *arrayNameMyEvent;
    NSMutableArray *arrayAddressMyEvent;
    NSMutableArray *arrayPicMyEvent;
    NSMutableArray *arrayDateMyEvent;
    NSMutableArray *arrayStartTimeMyEvent;
    NSMutableArray *arrayEndTimeMyEvent;
    NSMutableArray *arraypriceMyEvent;
    
    NSMutableArray *arraylatMyEvent;

    NSMutableArray *arraylongMyEvent;
    NSMutableArray *arraydescriptionMyEvent;
    
    NSMutableArray *arrayNamePastEvent;
    NSMutableArray *arrayAddressPastEvent;
    NSMutableArray *arrayPicPastEvent;
    NSMutableArray *arrayDatePastEvent;
    NSMutableArray *arrayStartTimePastEvent;
    NSMutableArray *arrayEndTimePastEvent;
    NSMutableArray *arraypricePastEvent;
    
    NSMutableArray *arraylatPastEvent;
    
    NSMutableArray *arraylongPastEvent;
    NSMutableArray *arraydescriptionPastEvent;

    
}

@end

@implementation MyEventCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_imageViewMyEvent.layer.cornerRadius = 55.0;
    UIGraphicsBeginImageContextWithOptions(_imageViewMyEvent.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:_imageViewMyEvent.bounds
                                cornerRadius:55.0] addClip];
    [_imageViewMyEvent.image drawInRect:_imageViewMyEvent.bounds];
    
    // Get the image, here setting the UIImageView image
    _imageViewMyEvent.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    
    NSString *profilepicchangeCheck=[[NSUserDefaults standardUserDefaults]objectForKey:@"profilepicchangeCheck"];
    
    NSString *imageProfile=[[NSUserDefaults standardUserDefaults]objectForKey:@"imageProfile"];
    
    NSString *userName=[[NSUserDefaults standardUserDefaults]objectForKey:@"username1"];

    
    if ([profilepicchangeCheck isEqualToString:@"1"]) {
        
        
        
        _imageViewMyEvent.layer.backgroundColor=[[UIColor clearColor] CGColor];
        
        
        _imageViewMyEvent.layer.cornerRadius=self.imageViewMyEvent.frame.size.width / 2;
        _imageViewMyEvent.layer.borderWidth=1.0;
        _imageViewMyEvent.layer.masksToBounds = YES;
        
        _imageViewMyEvent.layer.borderColor=[[UIColor whiteColor] CGColor];
        
        NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/profilepics/" stringByAppendingString:imageProfile];
        
        
        
        [_imageViewMyEvent sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        
        NSString *imageUrl1 = [@"http://122.180.254.6/progressbackend/public/profilepics/" stringByAppendingString:imageProfile];
        
        
        
        [_imageViewBackground sd_setImageWithURL:[NSURL URLWithString:imageUrl1] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        
        //        _imageViewProfilePic.image
        
        //        NSData* data = [imageProfile dataUsingEncoding:NSUTF8StringEncoding];
        //
        //        _imageViewProfilePic.image=[UIImage imageWithData:data];
        //
        //        _imageViewProfilePic.image=[UIImage imageNamed:@"imageDummy"];
        
        
        
        

        _labelUserNameEvent.text=userName;
        
        
    }else{
        
        _labelUserNameEvent.text=userName;

        
        
        
    }
    [PastEventTableViewCell setShadowView:self.viewonImage];
    
    _indicator.hidden=YES;
    arrayNameMyEvent=[[NSMutableArray alloc]init];
    
    
    arrayPicMyEvent =[[NSMutableArray alloc]init];
    
    arrayAddressMyEvent =[[NSMutableArray alloc]init];
    
    arrayDateMyEvent =[[NSMutableArray alloc]init];
    
    arrayStartTimeMyEvent =[[NSMutableArray alloc]init];
    
    arrayEndTimeMyEvent =[[NSMutableArray alloc]init];
    
    arraylatMyEvent =[[NSMutableArray alloc]init];
    
    arraylongMyEvent =[[NSMutableArray alloc]init];
    
    arraypriceMyEvent =[[NSMutableArray alloc]init];
    arraydescriptionMyEvent=[[NSMutableArray alloc]init];
    
    
    
    
    arrayNamePastEvent=[[NSMutableArray alloc]init];
    
    
    arrayPicPastEvent =[[NSMutableArray alloc]init];
    
    arrayAddressPastEvent =[[NSMutableArray alloc]init];
    
    arrayDatePastEvent =[[NSMutableArray alloc]init];
    
    arrayStartTimePastEvent =[[NSMutableArray alloc]init];
    
    arrayEndTimePastEvent =[[NSMutableArray alloc]init];
    
    arraylatPastEvent =[[NSMutableArray alloc]init];
    
    arraylongPastEvent =[[NSMutableArray alloc]init];
    
    arraypricePastEvent =[[NSMutableArray alloc]init];
    arraydescriptionPastEvent=[[NSMutableArray alloc]init];

    
//    self.scrollView.delegate=self;
//    int width=0;
//
//    self.scrollView.delaysContentTouches = YES;
//    self.scrollView.canCancelContentTouches = NO;
//    
//    width+=300;
//    
//    
//    
//    _scrollView.pagingEnabled = YES;
//    _scrollView.directionalLockEnabled = YES;
//    
//    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height-98);
    
    [self myEventFutureApi];
    
    

    

    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"Back-1"]  ;
    [backBtn setImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 40, 30);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn] ;
   // self.navigationItem.leftBarButtonItem = backButton;
    
}
- (void)goback
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = scrollView.frame.size.width;
    CGFloat x1 = scrollView.contentOffset.x;
    NSInteger page = (x1 + (0.5f * width)) / width;
    // NSLog(@"Page number is %li", (long)page);
    
    NSLog(@"%f", scrollView.contentOffset.x);
    NSLog(@"%f", scrollView.contentOffset.y);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark TableView Data source and delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == _tableViewMyEvent) {
        return [arrayNameMyEvent count];

    }else{
        
        
        return [arrayNamePastEvent count];
        
    }
    
    
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (tableView == _tableViewMyEvent) {
//        
//    
//    
//    static NSString *simpleTableIdentifier = @"MyEventCreateTableViewCell";
//    
//    MyEventCreateTableViewCell *cell = (MyEventCreateTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)
//    {
//        //        cell = [[FeaturedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
//        cell = (MyEventCreateTableViewCell *)[nib objectAtIndex:0];
//        
//    }
//    
//    //cell.imageViewEvent.image=[ev]
//    
//    NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:[arrayPicMyEvent objectAtIndex:indexPath.row]];
//    
//    
//    [cell.imageViewMyEvent sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
//    
//    cell.labelMyEventName.text=[arrayNameMyEvent objectAtIndex:indexPath.row];
//    
//    cell.labelEventTime.text=[arrayStartTimeMyEvent objectAtIndex:indexPath.row];
//    
//    cell.labelMyEventDate.text=[arrayDateMyEvent objectAtIndex:indexPath.row];
//    
//    cell.labelAMyEventddress.text=[arrayAddressMyEvent objectAtIndex:indexPath.row];
//    
//    //    if (!isFiltered) {
//    
//    //    cell.labelFriendList.text=[arrayName objectAtIndex:indexPath.row];
//    
//    return cell;
//        
//        
//    }else{
//        
//        
//        
//        static NSString *simpleTableIdentifier = @"PastEventTableViewCell";
//        
//        PastEventTableViewCell *cell = (PastEventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//        if (cell == nil)
//        {
//            //        cell = [[FeaturedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
//            
//            cell = (PastEventTableViewCell *)[nib objectAtIndex:0];
//            
//        }
//        
//        //cell.imageViewEvent.image=[ev]
//        
//        NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:[arrayPicPastEvent objectAtIndex:indexPath.row]];
//        
//        [cell.imageViewPastEvents sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
//        
//        cell.labelTitleNamePast.text=[arrayNameMyEvent objectAtIndex:indexPath.row];
//        
//        cell.labelTimePast.text=[arrayStartTimeMyEvent objectAtIndex:indexPath.row];
//        
//        cell.labelDatePastEvent.text=[arrayDateMyEvent objectAtIndex:indexPath.row];
//        
//        cell.labelAddressPast.text = [arrayAddressMyEvent objectAtIndex:indexPath.row];
//        
//        //    if (!isFiltered) {
//        
//        //    cell.labelFriendList.text=[arrayName objectAtIndex:indexPath.row];
//        
//        return cell;
//        
//    }
    static NSString *simpleTableIdentifier = @"PastEventTableViewCell";
    
    PastEventTableViewCell *cell = (PastEventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        //        cell = [[FeaturedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        
        cell = (PastEventTableViewCell *)[nib objectAtIndex:0];
        
    }
    
    //cell.imageViewEvent.image=[ev]
    if (tableView == _tableViewMyEvent) {
        NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:[arrayPicMyEvent objectAtIndex:indexPath.row]];
        [cell.imageViewPastEvents sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.labelTitleNamePast.text=[arrayNameMyEvent objectAtIndex:indexPath.row];
        cell.labelTimePast.text=[arrayStartTimeMyEvent objectAtIndex:indexPath.row];
        cell.labelDatePastEvent.text=[arrayDateMyEvent objectAtIndex:indexPath.row];
        cell.labelAddressPast.text = [arrayAddressMyEvent objectAtIndex:indexPath.row];
    }else{
        NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:[arrayPicPastEvent objectAtIndex:indexPath.row]];
        [cell.imageViewPastEvents sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.labelTitleNamePast.text=[arrayNamePastEvent objectAtIndex:indexPath.row];
        cell.labelTimePast.text=[arrayStartTimePastEvent objectAtIndex:indexPath.row];
        cell.labelDatePastEvent.text=[arrayDatePastEvent objectAtIndex:indexPath.row];
        cell.labelAddressPast.text = [arrayAddressPastEvent objectAtIndex:indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 99;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _tableViewMyEvent) {
        
    
    
    
    NSArray *valueNameFuture=[arrayNameMyEvent objectAtIndex:indexPath.row];
    NSArray *valueAddressFuture=[arrayAddressMyEvent objectAtIndex:indexPath.row];
    NSArray *valueImageFuture=[arrayPicMyEvent objectAtIndex:indexPath.row];
    NSArray *valueDateFuture=[arrayDateMyEvent objectAtIndex:indexPath.row];
    
    NSArray *valuePriceFuture=[arraypriceMyEvent objectAtIndex:indexPath.row];
    
    NSArray *valueStartTimeFuture=[arrayStartTimeMyEvent objectAtIndex:indexPath.row];
    
    NSArray *valueEndTimeFuture=[arrayEndTimeMyEvent objectAtIndex:indexPath.row];
    
    NSArray *valuelatFuture=[arraylatMyEvent objectAtIndex:indexPath.row];

    NSArray *valuelonFuture=[arraylongMyEvent objectAtIndex:indexPath.row];

    NSArray *valuedescriptionFuture=[arraydescriptionMyEvent objectAtIndex:indexPath.row];



    
    
    
    
    
       [[NSUserDefaults standardUserDefaults]synchronize];
    
    
  /*  UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *init4inchViewController = [storyBoard instantiateViewControllerWithIdentifier:@"FutureDetailViewController"];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.navigationController pushViewController:init4inchViewController animated:NO];*/
        
        NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
        [dic setValue:valuelonFuture forKey:@"valuelonAdmin"];
        [dic setValue:valuelatFuture forKey:@"valuelatAdmin"];
        [dic setValue:valueAddressFuture forKey:@"address"];
        [dic setValue:valueEndTimeFuture forKey:@"valueEndTimeAdmin"];
        [dic setValue:valueStartTimeFuture forKey:@"valueStartTimeAdmin"];
        [dic setValue:valuedescriptionFuture forKey:@"valuedescriptionAdmin"];
        [dic setValue:valuePriceFuture forKey:@"valuePriceAdmin"];
        [dic setValue:valueDateFuture forKey:@"valueDateAdmin"];
        [dic setValue:valueImageFuture forKey:@"valueImageAdmin"];
        [dic setValue:@"" forKey:@"MaxAttendEvent"];
        
        [dic setValue:valueNameFuture forKey:@"valueNameAdmin"];
        [dic setValue:@"" forKey:@"valueTotalAttend"];
        [dic setValue:@"" forKey:@"valueidAttend"];
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DashboardNextScreenViewController *init4inchViewController = [storyBoard instantiateViewControllerWithIdentifier:@"DashboardNextScreenViewController"];
        init4inchViewController.dicdata = dic;
        //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [self.navigationController pushViewController:init4inchViewController animated:NO];
    
    }
    else{
        
        
        
        
        NSArray *valueNamePast=[arrayNamePastEvent objectAtIndex:indexPath.row];
        NSArray *valueAddressPast=[arrayAddressPastEvent objectAtIndex:indexPath.row];
        NSArray *valueImagePast=[arrayPicPastEvent objectAtIndex:indexPath.row];
        NSArray *valueDatePast=[arrayDatePastEvent objectAtIndex:indexPath.row];
        
        NSArray *valuePricePast=[arraypricePastEvent objectAtIndex:indexPath.row];
        
        NSArray *valueStartTimePast=[arrayStartTimePastEvent objectAtIndex:indexPath.row];
        
        NSArray *valueEndTimePast=[arrayEndTimePastEvent objectAtIndex:indexPath.row];
        
        NSArray *valuelatPast=[arraylatPastEvent objectAtIndex:indexPath.row];
        
        NSArray *valuelonPast=[arraylongPastEvent objectAtIndex:indexPath.row];
        
        NSArray *valuedescriptionPast=[arraydescriptionPastEvent objectAtIndex:indexPath.row];
        
     
        
      /*  UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *init4inchViewController = [storyBoard instantiateViewControllerWithIdentifier:@"PastEventDetailViewController"];
        //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [self.navigationController pushViewController:init4inchViewController animated:NO];
        */
        NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
        [dic setValue:valuelonPast forKey:@"valuelonAdmin"];
        [dic setValue:valuelatPast forKey:@"valuelatAdmin"];
        [dic setValue:valueAddressPast forKey:@"address"];
        [dic setValue:valueEndTimePast forKey:@"valueEndTimeAdmin"];
        [dic setValue:valueStartTimePast forKey:@"valueStartTimeAdmin"];
        [dic setValue:valuedescriptionPast forKey:@"valuedescriptionAdmin"];
        [dic setValue:valuePricePast forKey:@"valuePriceAdmin"];
        [dic setValue:valueDatePast forKey:@"valueDateAdmin"];
        [dic setValue:valueImagePast forKey:@"valueImageAdmin"];
        [dic setValue:@"" forKey:@"MaxAttendEvent"];
        
        [dic setValue:valueNamePast forKey:@"valueNameAdmin"];
        [dic setValue:@"" forKey:@"valueTotalAttend"];
        [dic setValue:@"" forKey:@"valueidAttend"];
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AdminDashBoardNextScreenViewController *init4inchViewController = [storyBoard instantiateViewControllerWithIdentifier:@"AdminDashBoardNextScreenViewController"];
        init4inchViewController.dicdata = dic;
        //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [self.navigationController pushViewController:init4inchViewController animated:NO];
        
        
        
        
    }
}

-(void)myEventFutureApi {
    
        _indicator.hidden=NO;
        [_indicator startAnimating];
    
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,getownevents];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
        NSString *key = @"key=";
 
        NSString *concatenate1 = [key stringByAppendingString:@"Future"];

    
    
    //NSString *post = [URL stringByAppendingString:stringWithoutSpaces];
    
        NSData *postData = [concatenate1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        
                [_indicator stopAnimating];
                _indicator.hidden=YES;

        
        if(data!=nil){
            
            [arrayNameMyEvent removeAllObjects];
            [arrayAddressMyEvent removeAllObjects];
            [arrayDateMyEvent removeAllObjects];
            [arrayPicMyEvent removeAllObjects];
            [arrayStartTimeMyEvent removeAllObjects];
            [arrayEndTimeMyEvent removeAllObjects];
            
            [arraypriceMyEvent removeAllObjects];
            
            [arraylongMyEvent removeAllObjects];
            
            [arraylatMyEvent removeAllObjects];
            
            [arraydescriptionMyEvent removeAllObjects];
            
            
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
                
                NSString *price=[dict valueForKey:@"price"];
                
                NSString *lat=[dict valueForKey:@"latitude"];
                
                NSString *lon=[dict valueForKey:@"longitude"];
                
                NSString *description=[dict valueForKey:@"description"];


                
                [arrayNameMyEvent addObject:nameEvent];
                [arrayAddressMyEvent addObject:addressEvent];
                [arrayDateMyEvent addObject:eventDateCorrectFormate];
                [arrayPicMyEvent addObject:eventpic];
                [arrayStartTimeMyEvent addObject:starttime];
                [arrayEndTimeMyEvent addObject:endtime];
                
                [arraypriceMyEvent addObject:price];
                
                [arraylongMyEvent addObject:lon];
                
                [arraylatMyEvent addObject:lat];
                
                [arraydescriptionMyEvent addObject:description];
                
                
            }
            [_tableViewMyEvent setHidden:false];
            [_tabloeViewPastEvent setHidden:true];
            [_tableViewMyEvent reloadData];
                    }
    }];
}



-(void)myEventPastApi {
    
        _indicator.hidden=NO;
        [_indicator startAnimating];
    
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,getownevents];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSString *key = @"key=";
    
    NSString *concatenate1 = [key stringByAppendingString:@"Past"];
    
    
    
    //NSString *post = [URL stringByAppendingString:stringWithoutSpaces];
    
    NSData *postData = [concatenate1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        
                [_indicator stopAnimating];
                _indicator.hidden=YES;
        
        
        if(data!=nil){
            
            [arrayNamePastEvent removeAllObjects];
            [arrayAddressPastEvent removeAllObjects];
            [arrayDatePastEvent removeAllObjects];
            [arrayPicPastEvent removeAllObjects];
            [arrayStartTimePastEvent removeAllObjects];
            [arrayEndTimePastEvent removeAllObjects];
            
            [arraypricePastEvent removeAllObjects];
            
            [arraylongPastEvent removeAllObjects];
            
            [arraylatPastEvent removeAllObjects];
            
            [arraydescriptionPastEvent removeAllObjects];
            
            
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
                
                NSString *price=[dict valueForKey:@"price"];
                
                NSString *lat=[dict valueForKey:@"latitude"];
                
                NSString *lon=[dict valueForKey:@"longitude"];
                
                NSString *description=[dict valueForKey:@"description"];
                
                
                [arrayNamePastEvent addObject:nameEvent];
                [arrayAddressPastEvent addObject:addressEvent];
                [arrayDatePastEvent addObject:eventDateCorrectFormate];
                [arrayPicPastEvent addObject:eventpic];
                [arrayStartTimePastEvent addObject:starttime];
                [arrayEndTimePastEvent addObject:endtime];
                
                [arraypricePastEvent addObject:price];
                
                [arraylongPastEvent addObject:lon];
                
                [arraylatPastEvent addObject:lat];
                
                [arraydescriptionPastEvent addObject:description];
                
                
            }
            [_tableViewMyEvent setHidden:true];
            [_tabloeViewPastEvent setHidden:false];
            [_tabloeViewPastEvent reloadData];
            
                    }
    }];
}


-(void)callAlert:(NSString *)Title message:(NSString *)Message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction  = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}



- (IBAction)backButtonCtion:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
//    
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}


- (IBAction)buttonFutureEventAction:(id)sender {
    
    
    
  //  _buttonFutureEvents.backgroundColor=[UIColor blackColor];
    
    [_buttonFutureEvents setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
  //  _buttonPastEvent.backgroundColor=[UIColor whiteColor];
    
    [_buttonPastEvent setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [self myEventFutureApi];
    
//  
//    
//    CGRect frame = _scrollView.frame;
//    frame.origin.x = frame.size.width * 0;
//    frame.origin.y = 0;
//    [_scrollView scrollRectToVisible:frame animated:NO];
//    
    
    
}


- (IBAction)buttonPastEventAction:(id)sender {
    
    
//    _buttonPastEvent.backgroundColor=[UIColor blackColor];
    
    [_buttonPastEvent setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
//    _buttonFutureEvents.backgroundColor=[UIColor whiteColor];
    
    [_buttonFutureEvents setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//    
//    
//    CGRect frame = _scrollView.frame;
//    frame.origin.x = frame.size.width * 1;
//    frame.origin.y = 0;
//    [_scrollView scrollRectToVisible:frame animated:NO];
    
    [self myEventPastApi];
    
    
}

- (IBAction)settingButton:(id)sender {
    
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    UIViewController *obj = [str instantiateViewControllerWithIdentifier:@"ProfileAccountViewController"];
    
    [self.navigationController pushViewController:obj animated:true];
    
    
    
    
}


- (IBAction)backButtonAction:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:true];
    
    
}

@end
