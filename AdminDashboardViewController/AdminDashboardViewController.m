//
//  AdminDashboardViewController.m
//  Events
//
//  Created by user on 2/14/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AdminDashboardViewController.h"
#import "CreateEventScreenViewController.h"

#import "FirstScreenViewController.h"

#import "AdminDashboardTableViewCell.h"

#import "Model.h"
#import "Constant.h"

#import "UIImageView+WebCache.h"

#import "AdminDashBoardUserTableViewCell.h"
#import "AdminDashBoardNextScreenViewController.h"
#import "ViewController.h"

#import "UserAdminEventTableViewCell.h"
#import "DashboardNextScreenViewController.h"
#import "PastEventTableViewCell.h"


@interface AdminDashboardViewController (){
    
    
    NSMutableArray *arrayNameaAdminEvent;
    
    NSMutableArray *arrayAddressAdminEvent;
    
    NSMutableArray *arrayMaxAttend;
    
    
    
    
    NSMutableArray *arrayidAdminEvent;
    
    NSMutableArray *arrayRateAdminEvent;
    NSMutableArray *arrayPicAdminEvent;
    NSMutableArray *arrayDateAdminEvent;
    NSMutableArray *arrayStartTimeAdminEvent;
    NSMutableArray *arrayEndTimeAdminEvent;
    
    NSMutableArray *arrayDescriptionAdminEvent;
    
    
    NSMutableArray *arraylatAdminEvent;
    
    
    NSMutableArray *arraylonAdminEvent;
    
    
    NSMutableArray *arrayAdminName;
    
    NSMutableArray *arrayusername;
    NSMutableArray *arrayProfilePic;
    
    NSMutableArray *arrayTotalAttend;
    
    NSMutableArray *arrayUserId;
    
    int x1;
    
    NSInteger updatedIndex;
    NSInteger currentIndex;
    
    CGFloat screenHeight;
    CGFloat screenWidth;
    
    NSString *indexPage;
    
    NSMutableArray *arrayFilter;
    
    
}

@end

@implementation AdminDashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSString *hidepopupmessage=[[NSUserDefaults standardUserDefaults]objectForKey:@"hidepopupmessage"];
    //
    //    if ([hidepopupmessage isEqualToString:@"1"]) {
    //
    //        _customViewPopUp.hidden=NO;
    //    }else{
    //
    //        _customViewPopUp.hidden=YES;
    //
    //
    //    }
    self.title =@"Progress";
    _tableViewUser.hidden=YES;
    
    _imageViewDeletePopUp.layer.backgroundColor=[[UIColor clearColor] CGColor];
    
    
    _imageViewDeletePopUp.layer.cornerRadius=self.imageViewDeletePopUp.frame.size.width / 2;
    _imageViewDeletePopUp.layer.borderWidth=1.0;
    _imageViewDeletePopUp.layer.masksToBounds = YES;
    
    //_imageViewDeletePopUp.layer.borderColor=[[UIColor whiteColor] CGColor];
    
    [self.customViewPopUp.layer setBorderWidth:0.5];
    _customViewPopUp.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    [_labelMessagePop setNumberOfLines:0];
    
    [_labelMessagePop setLineBreakMode:NSLineBreakByWordWrapping];
    [_labelMessagePop sizeToFit];
    
    [self eventgetAllApi];
    
    [PastEventTableViewCell setShadowView:self.viewEventUser];
    //    [self.viewEventUser.layer setBorderWidth:1.0];
    //
    //    _viewEventUser.layer.borderColor=[[UIColor darkGrayColor]CGColor];
    
    [_buttonFilter.layer setBorderWidth:1.0];
    
    _buttonFilter.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    _viewDone.hidden=YES;
    
    _pickerViewEvent.hidden=YES;
    
    _viewMenuDashBoard.hidden=YES;
    
    arrayFilter =[[NSMutableArray alloc]initWithObjects:@"Day",@"Week",@"Month",@"Year",nil];
    
    arrayNameaAdminEvent =[[NSMutableArray alloc]init];
    
    arrayidAdminEvent= [[NSMutableArray alloc]init];
    arrayDescriptionAdminEvent =[[NSMutableArray alloc]init];
    
    arrayAddressAdminEvent=[[NSMutableArray alloc]init];
    
    arraylatAdminEvent =[[NSMutableArray alloc]init];
    
    arraylonAdminEvent =[[NSMutableArray alloc]init];
    
    arrayPicAdminEvent =[[NSMutableArray alloc]init];
    
    arrayRateAdminEvent =[[NSMutableArray alloc]init];
    
    arrayDateAdminEvent =[[NSMutableArray alloc]init];
    
    arrayStartTimeAdminEvent =[[NSMutableArray alloc]init];
    
    arrayEndTimeAdminEvent =[[NSMutableArray alloc]init];
    
    arrayusername = [[NSMutableArray alloc]init];
    
    arrayProfilePic = [[NSMutableArray alloc]init];
    
    arrayTotalAttend = [[NSMutableArray alloc]init];
    
    arrayUserId = [[NSMutableArray alloc]init];
    
    arrayMaxAttend = [[NSMutableArray alloc]init];
    
    
    
    x1=0;
    
    
    //  [self eventCountUserApi];
    
    
    
    // int width=0;
    
    
    
    // [_scrollView addSubview:_tableView];
    
    //    self.scrollView.delaysContentTouches = YES;
    //    self.scrollView.canCancelContentTouches = NO;
    //
    //    width+=300;
    //
    //        _scrollView.pagingEnabled = YES;
    //    _scrollView.directionalLockEnabled = YES;
    //
    //    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height-98);
    
    
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
    //                                   initWithTarget:self
    //                                   action:@selector(dismissKeyboard)];
    //
    //    [self.view addGestureRecognizer:tap];
    
    
}


#pragma gesture methods

-(void)dismissKeyboard {
    
    
    _pickerViewEvent.hidden=YES;
    
    
    _viewDone.hidden=YES;
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonDashboardAction:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"AdminDashboardViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}



- (IBAction)buttonCreateEventAction:(id)sender {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CreateEventScreenViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CreateEventScreenViewController"];
    vc.strpage = @"create";

    [self.navigationController pushViewController:vc animated:YES];
    
}


- (IBAction)buttonSignoutAction:(id)sender {
    
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)buttonEventAction:(id)sender {
    
    
    _buttonFilter.hidden=NO;
    
    _tableViewAdminDashboard.hidden=NO;
    
    _tableViewUser.hidden=YES;
    
    //  _buttonUser.backgroundColor=[UIColor whiteColor];
    
    [_buttonUser setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    // _buttonEvent.backgroundColor=[UIColor blackColor];
    
    [_buttonEvent setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //    CGRect frame = _scrollView.frame;
    //    frame.origin.x = frame.size.width * 0;
    //    frame.origin.y = 0;
    //    [_scrollView scrollRectToVisible:frame animated:NO];
    
    
    
}

- (IBAction)buttonUserAction:(id)sender {
    
    _tableViewAdminDashboard.hidden=YES;
    
    _tableViewUser.hidden=NO;
    
    
    
    // _buttonUser.backgroundColor=[UIColor blackColor];
    
    [_buttonUser setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //  _buttonEvent.backgroundColor=[UIColor whiteColor];
    
    [_buttonEvent setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    _buttonFilter.hidden=YES;
    
    
    //
    //    CGRect frame = _scrollView.frame;
    //    frame.origin.x = frame.size.width * 1;
    //    frame.origin.y = 0;
    //    [_scrollView scrollRectToVisible:frame animated:NO];
    
    [self usergetAllApi];
    
}



- (IBAction)buttonFilterAction:(id)sender {
    
    _pickerViewEvent.hidden=NO;
    _viewDone.hidden=NO;
    
}

- (IBAction)buttonMenuAction:(id)sender {
    
    
    if (x1==0) {
        [UIView animateWithDuration:0.4 animations:^{
            _viewMenuDashBoard.frame=CGRectMake(0,self.viewMenuDashBoard.frame.origin.y,self.viewMenuDashBoard.frame.size.width,self.viewMenuDashBoard.frame.size.height);
            //            _transperant_view.frame=CGRectMake(0,self.transperant_view.frame.origin.y,self.transperant_view.frame.size.width,self.transperant_view.frame.size.height);
            //            _transperant_view.hidden=NO;
            _viewMenuDashBoard.hidden=NO;
            NSLog(@"left");
            
        }];
        
        
        x1=1;
    }
    else{
        NSLog(@"heyy%d",x1);
        [UIView animateWithDuration:0.4 animations:^{
            _viewMenuDashBoard.frame=CGRectMake(-417,self.viewMenuDashBoard.frame.origin.y,self.viewMenuDashBoard.frame.size.width,self.viewMenuDashBoard.frame.size.height);
            //            _transperant_view.frame=CGRectMake(-500,self.transperant_view.frame.origin.y,self.transperant_view.frame.size.width,self.transperant_view.frame.size.height);
            
            
            //            _transperant_view.hidden=YES;
            NSLog(@"right");
        }];
        x1=0;
    }
    
    
    
}


-(void)moveFromLefttoRight:(NSTimer *) timer {
    BOOL isLeft = [timer.userInfo boolValue];
    CGFloat bounceDistance = 10;
    CGFloat bounceDuration = 0.1;
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         CGFloat direction = (isLeft ? 1 : -1);
                         self.viewMenuDashBoard.center = CGPointMake(self.viewMenuDashBoard.frame.size.width/2 + direction*bounceDistance, self.viewMenuDashBoard.center.y);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:bounceDuration animations:^{
                             self.viewMenuDashBoard.center = CGPointMake(self.viewMenuDashBoard.frame.size.width/2, self.viewMenuDashBoard.center.y);
                         }];
                     }];
}



# pragma mark TableView Data source and delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == _tableViewAdminDashboard) {
        return [arrayNameaAdminEvent count];
        
    }else{
        
        return [arrayusername count];
        
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (tableView == _tableViewAdminDashboard) {
        
        //        [_tableViewAdminDashboard setHidden:false];
        
        static NSString *simpleTableIdentifier = @"AdminDashboardTableViewCell";
        
        AdminDashboardTableViewCell *cell = (AdminDashboardTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            //        cell = [[FeaturedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
            cell = (AdminDashboardTableViewCell *)[nib objectAtIndex:0];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        //cell.imageViewEvent.image=[ev]
        
        NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:[arrayPicAdminEvent objectAtIndex:indexPath.row]];
        //
        //
        [cell.imageViewAdmineEvent sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.imageViewAdmineEvent.clipsToBounds=YES;
        cell.labelAdminEventName.text=[arrayNameaAdminEvent objectAtIndex:indexPath.row];
        
        cell.labelAdminEventRate.text=[arrayMaxAttend objectAtIndex:indexPath.row];
        
        cell.labelAdminEventDate.text=[arrayDateAdminEvent objectAtIndex:indexPath.row];
        
        cell.labelAdminEventAddress.text=[arrayAddressAdminEvent objectAtIndex:indexPath.row];
        
        //
        //
        //        //    if (!isFiltered) {
        //
        //        //    cell.labelFriendList.text=[arrayName objectAtIndex:indexPath.row];
        //        cell.layer.borderWidth = 1;
        //        cell.layer.borderColor =[[UIColor grayColor] CGColor];
        return cell;
        
    }else{
        
        
        static NSString *simpleTableIdentifier = @"UserAdminEventTableViewCell";
        
        UserAdminEventTableViewCell *cell = (UserAdminEventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            //        cell = [[FeaturedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
            cell = (UserAdminEventTableViewCell *)[nib objectAtIndex:0];
            
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        
        
        cell.labelNameUserAdmin.text=[arrayusername objectAtIndex:indexPath.row];
        
        
        
        //cell.imageViewUserAdmin.layer.cornerRadius=cell.imageViewUserAdmin.frame.size.width / 2;
        
        cell.imageViewUserAdmin.clipsToBounds=YES;
        
        
        // NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/profilepics/" stringByAppendingString:[arrayProfilePic objectAtIndex:indexPath.row]];
        
        //[cell.imageViewUserAdmin sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        
        
        //
        //        cell.labelAdminEventRate.text=[arrayRateAdminEvent objectAtIndex:indexPath.row];
        //
        //        cell.labelAdminEventDate.text=[arrayDateAdminEvent objectAtIndex:indexPath.row];
        //        //
        //
        //
        //        cell.layer.borderWidth = 1;
        //        cell.layer.borderColor =[[UIColor grayColor] CGColor];
        return cell;
        
        
        
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==_tableViewAdminDashboard) {
        return 100;
        
    }else{
        
        return 76;
    }
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _tableViewAdminDashboard) {
        NSArray *valueNameAdmin=[arrayNameaAdminEvent objectAtIndex:indexPath.row];
        NSArray *valueImageAdmin=[arrayPicAdminEvent objectAtIndex:indexPath.row];
        NSArray *valueDateAdmin=[arrayDateAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *valuePriceAdmin=[arrayRateAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *valueStartTimeAdmin=[arrayStartTimeAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *valueEndTimeAdmin=[arrayEndTimeAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *valuelatAdmin=[arraylatAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *valuelonAdmin=[arraylonAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *valuedescriptionAdmin=[arrayDescriptionAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *valueTotalAttend=[arrayTotalAttend objectAtIndex:indexPath.row];
        
        NSArray *valueidAttend=[arrayidAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *address=[arrayAddressAdminEvent objectAtIndex:indexPath.row];
        
        NSArray *maxattend=[arrayMaxAttend objectAtIndex:indexPath.row];
 
        NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
        [dic setValue:valuelonAdmin forKey:@"valuelonAdmin"];
        [dic setValue:valuelatAdmin forKey:@"valuelatAdmin"];
        [dic setValue:address forKey:@"address"];
        [dic setValue:valueEndTimeAdmin forKey:@"valueEndTimeAdmin"];
        [dic setValue:valueStartTimeAdmin forKey:@"valueStartTimeAdmin"];
        [dic setValue:valuedescriptionAdmin forKey:@"valuedescriptionAdmin"];
        [dic setValue:valuePriceAdmin forKey:@"valuePriceAdmin"];
        [dic setValue:valueDateAdmin forKey:@"valueDateAdmin"];
        [dic setValue:valueImageAdmin forKey:@"valueImageAdmin"];
        [dic setValue:maxattend forKey:@"MaxAttendEvent"];

        [dic setValue:valueNameAdmin forKey:@"valueNameAdmin"];
        [dic setValue:valueTotalAttend forKey:@"valueTotalAttend"];
        [dic setValue:valueidAttend forKey:@"valueidAttend"];
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DashboardNextScreenViewController *init4inchViewController = [storyBoard instantiateViewControllerWithIdentifier:@"DashboardNextScreenViewController"];
        init4inchViewController.dicdata = dic;
        //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [self.navigationController pushViewController:init4inchViewController animated:NO];
        
        
    }else{
        
        
        
        NSArray *UserId=[arrayUserId objectAtIndex:indexPath.row];
        
        [[NSUserDefaults standardUserDefaults]setObject:UserId forKey:@"UserId"];
        
        
        
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
    }
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        if (tableView == _tableViewAdminDashboard) {
            
            [self deleteEventApi];
            
        }else{
            
            NSArray *UserId=[arrayUserId objectAtIndex:indexPath.row];
            
            [[NSUserDefaults standardUserDefaults]setObject:UserId forKey:@"UserId"];
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            [self deleteUserApi];
            
            
        }
        
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        //        [arrayNameaAdminEvent removeAllObjects];
        //        [arrayRateAdminEvent removeAllObjects];
        //        [arrayDateAdminEvent removeAllObjects];
        //        [arrayPicAdminEvent removeAllObjects];
        //        [arrayStartTimeAdminEvent removeAllObjects];
        //        [arrayEndTimeAdminEvent removeAllObjects];
        
    }
}


-(void)eventgetAllApi {
    
    //    _indicatorLogin.hidden=NO;
    //    [_indicatorLogin startAnimating];
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,getevents];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        
        //        [_indicatorLogin stopAnimating];
        //        _indicatorLogin.hidden=YES;
        
        
        
        if(data!=nil){
            
            
            [arrayNameaAdminEvent removeAllObjects];
            [arrayRateAdminEvent removeAllObjects];
            [arrayDateAdminEvent removeAllObjects];
            [arrayPicAdminEvent removeAllObjects];
            [arrayStartTimeAdminEvent removeAllObjects];
            [arrayEndTimeAdminEvent removeAllObjects];
            
            [arrayDescriptionAdminEvent removeAllObjects];
            
            [arraylatAdminEvent removeAllObjects];
            
            [arraylonAdminEvent removeAllObjects];
            
            
            [arrayTotalAttend removeAllObjects];
            
            [arrayidAdminEvent removeAllObjects];
            
            [arrayAddressAdminEvent removeAllObjects];
            
            [arrayMaxAttend removeAllObjects];
            
            
            NSError *jsonError;
            
            NSData *objectData = [noti dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            NSLog(@"%@",json);
            
            NSString *monthEvent=[NSString stringWithFormat:@"%@",[json objectForKey:@"month_event"]];
            
            
            
            NSLog(@"month %@",monthEvent);
            
            NSString *todayEvent=[NSString stringWithFormat:@"%@",[json objectForKey:@"today_event"]];
            
            
            NSString *weekEvent=[NSString stringWithFormat:@"%@",[json objectForKey:@"week_event"]];
            
            
            
            NSString *yearEvent=[NSString stringWithFormat:@"%@",[json objectForKey:@"year_event"]];
            
            [[NSUserDefaults standardUserDefaults]setObject:monthEvent forKey:@"monthEvent"];
            
            [[NSUserDefaults standardUserDefaults]setObject:todayEvent forKey:@"todayEvent"];
            [[NSUserDefaults standardUserDefaults]setObject:weekEvent forKey:@"weekEvent"];
            [[NSUserDefaults standardUserDefaults]setObject:yearEvent forKey:@"yearEvent"];
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            NSString *monthEvent1 = [[NSUserDefaults standardUserDefaults]objectForKey:@"monthEvent"];
            
            NSString  *todayEvent1 = [[NSUserDefaults standardUserDefaults]objectForKey:@"todayEvent"];
            NSString  *weekEvent1 = [[NSUserDefaults standardUserDefaults]objectForKey:@"weekEvent"];
            NSString  *yearEvent1 =  [[NSUserDefaults standardUserDefaults]objectForKey:@"yearEvent"];
            
            NSString *events=@"Events";
            
            NSString *fullTodayEvent=[[todayEvent1 stringByAppendingString:@" "]stringByAppendingString:events];
            
            NSString *fullWeekEvent=[[weekEvent1 stringByAppendingString:@" "]stringByAppendingString:events];
            
            NSString *fullMonthEvent=[[monthEvent1 stringByAppendingString:@" "]stringByAppendingString:events];
            
            
            NSString *fullYearEvent=[[yearEvent1 stringByAppendingString:@" "]stringByAppendingString:events];
            
            
            _labelEventToday.text=fullTodayEvent;
            _labelEventThisWeek.text=fullWeekEvent;
            _labelEventThisMonth.text=fullMonthEvent;
            
            _labelEventThisYear.text=fullYearEvent;
            
            
            NSArray *Data = [json objectForKey:@"Data"];
            
            NSArray *allData=[Data valueForKey:@"data"];
            
            for (int i=0; i < allData.count; i++) {
                
                NSDictionary *dict=[allData objectAtIndex:i];
                
                NSArray *nameEvent=[dict valueForKey:@"name"];
                NSString *price=[dict valueForKey:@"price"];
                NSString *eventdate=[dict valueForKey:@"event_date"];
                
                NSString *maxAttend=[NSString stringWithFormat:@"%@",[dict valueForKey:@"max_attend"]];
                
                
                
                NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
                dateFormatter.dateFormat = @"yyyy-MM-dd";
                NSDate *yourDate = [dateFormatter dateFromString:eventdate];
                dateFormatter.dateFormat = @"dd/MM/yyyy";
                
                NSString *eventDateCorrectFormate= [NSString stringWithFormat:@"%@",
                                                    [dateFormatter stringFromDate:yourDate]];
                
                
                
                
                
                NSString *addressEvent=[dict valueForKey:@"address"];
                
                NSString *eventpic=[dict valueForKey:@"event_pic"];
                NSString *starttime=[dict valueForKey:@"start_time"];
                NSString *endtime=[dict valueForKey:@"end_time"];
                NSString *lat=[dict valueForKey:@"latitude"];
                
                NSString *lon=[dict valueForKey:@"longitude"];
                
                NSString *description=[dict valueForKey:@"description"];
                
                NSString *totalattend=[NSString stringWithFormat:@"%@",[dict valueForKey:@"total_attend"]];
                
                NSString *idMain= [NSString stringWithFormat:@"%@",[ dict valueForKey:@"id"]];
                
                NSLog(@"idmain %@",idMain);
                
                
                [arrayNameaAdminEvent addObject:nameEvent];
                [arrayRateAdminEvent addObject:price];
                [arrayDateAdminEvent addObject:eventDateCorrectFormate];
                [arrayPicAdminEvent addObject:eventpic];
                [arrayStartTimeAdminEvent addObject:starttime];
                [arrayEndTimeAdminEvent addObject:endtime];
                
                [arrayDescriptionAdminEvent addObject:description];
                
                [arraylatAdminEvent addObject:lat];
                
                [arraylonAdminEvent addObject:lon];
                
                [arrayTotalAttend addObject:totalattend];
                
                [arrayidAdminEvent addObject:idMain];
                
                [arrayAddressAdminEvent addObject:addressEvent];
                
                [arrayMaxAttend addObject:maxAttend];
                
                
            }
            //            [_tableViewUser setHidden:YES];
            //            [_tableViewAdminDashboard setHidden:NO];
            [_tableViewAdminDashboard reloadData];
            
        }
    }];
}



-(void)usergetAllApi {
    
    //    _indicatorLogin.hidden=NO;
    //    [_indicatorLogin startAnimating];
    
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,getallusers];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        
        //        [_indicatorLogin stopAnimating];
        //        _indicatorLogin.hidden=YES;
        
        
        if(data!=nil){
            
            
            [arrayProfilePic removeAllObjects];
            
            [arrayusername removeAllObjects];
            
            [arrayUserId removeAllObjects];
            
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
                
                NSArray *username=[dict valueForKey:@"username"];
                
                NSString *profilepic=[dict valueForKey:@"profile_pic"];
                
                NSString *idUser=[NSString stringWithFormat:@"%@",[dict valueForKey:@"id"]];
                
                
                
                if ([profilepic isKindOfClass:[NSNull class]]){
                    
                    NSString *data1=@"";
                    
                    //                    UIImage *image=[UIImage imageNamed:@"special-events-hero-image.jpg"];
                    //
                    //                     NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
                    //
                    //                    NSString *base64 = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding] ;
                    
                    
                    [arrayProfilePic addObject:data1];
                    
                    
                    
                    
                    
                }
                
                else{
                    
                    [arrayProfilePic addObject:profilepic];
                    
                    
                    
                }
                
                
                
                [arrayusername addObject:username];
                [arrayUserId addObject:idUser];
                
                
                //                [arrayDateAdminEvent addObject:eventdate];
                //                [arrayPicAdminEvent addObject:eventpic];
                //                [arrayStartTimeAdminEvent addObject:starttime];
                //                [arrayEndTimeAdminEvent addObject:endtime];
                
            }
            //            [_tableViewAdminDashboard setHidden:YES];
            //            [_tableViewUser setHidden:NO];
            [_tableViewUser reloadData];
            
        }
    }];
}

-(void)deleteEventApi {
    
    //    _indicatorLogin.hidden=NO;
    //    [_indicatorLogin startAnimating];
    
    
    NSString *valueidAttend=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueidAttend"];
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,deleteanyevent];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSString *eventid = @"event_id=";
    //
    //    NSString *password_ = @"&password=";
    //
    NSString *concatenate1 = [eventid stringByAppendingString:valueidAttend];
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
            
            NSArray *message = [json objectForKey:@"message"];
            
            
            if ([message isEqual:@"Success"]) {
                
                
                
                
                [self eventgetAllApi];
                
                
                
                
            }
            
            
            
            
            
            
            
        }
    }];
}

-(void)deleteUserApi {
    
    //    _indicatorLogin.hidden=NO;
    //    [_indicatorLogin startAnimating];
    
    
    NSString *UserId=[[NSUserDefaults standardUserDefaults]objectForKey:@"UserId"];
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,deleteanyuser];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSString *user_id = @"user_id=";
    
    //    NSString *password_ = @"&password=";
    
    NSString *concatenate1 = [user_id stringByAppendingString:UserId];
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
            
            NSArray *message = [json objectForKey:@"message"];
            
            
            if ([message isEqual:@"Success"]) {
                
                
                
                
                [self usergetAllApi];
                
                
                
                
            }
            
            
            
        }
    }];
}



-(void)callAlert:(NSString *)Title message:(NSString *)Message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction  = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


- (IBAction)buttonDoneAction:(id)sender {
    
    
    _pickerViewEvent.hidden=YES;
    
    
    _viewDone.hidden=YES;
    
    [self eventAccordingToDayApi];
    
    
}


#pragma mark PickerViewDelegate



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return arrayFilter.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [arrayFilter objectAtIndex:row];
}




- (void)pickerView:(UIPickerView *)PickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *eventsSelectKey=[arrayFilter objectAtIndex:row];
    
    NSLog( @"filter value %@",eventsSelectKey);
    
    
    [[NSUserDefaults standardUserDefaults]setObject:eventsSelectKey forKey:@"eventsSelectKey"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}



-(void)eventAccordingToDayApi {
    
    //        _indicatorLogin.hidden=NO;
    //        [_indicatorLogin startAnimating];
    //
    
    
    NSString *eventsSelectKey=[[NSUserDefaults standardUserDefaults]objectForKey:@"eventsSelectKey"];
    
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,getevents];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSString *filterby = @"filter_by=";
    
    
    NSString *concatenate1 = [filterby stringByAppendingString:eventsSelectKey];
    
    
    //    NSString *concatenate2 = [concatenate1 stringByAppendingString:concatenate2];
    
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
            
            [arrayNameaAdminEvent removeAllObjects];
            [arrayRateAdminEvent removeAllObjects];
            [arrayDateAdminEvent removeAllObjects];
            [arrayPicAdminEvent removeAllObjects];
            [arrayStartTimeAdminEvent removeAllObjects];
            [arrayEndTimeAdminEvent removeAllObjects];
            
            [arrayDescriptionAdminEvent removeAllObjects];
            
            [arraylatAdminEvent removeAllObjects];
            
            [arraylonAdminEvent removeAllObjects];
            
            
            [arrayTotalAttend removeAllObjects];
            
            [arrayidAdminEvent removeAllObjects];
            
            [arrayAddressAdminEvent removeAllObjects];
            
            [arrayMaxAttend removeAllObjects];
            
            
            
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
                NSString *price=[dict valueForKey:@"price"];
                NSString *addressEvent=[dict valueForKey:@"address"];
                
                NSString *eventdate=[dict valueForKey:@"event_date"];
                
                NSString *maxAttend=[NSString stringWithFormat:@"%@",[dict valueForKey:@"max_attend"]];
                
                
                
                NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
                dateFormatter.dateFormat = @"yyyy-MM-dd";
                NSDate *yourDate = [dateFormatter dateFromString:eventdate];
                dateFormatter.dateFormat = @"dd/MM/yyyy";
                
                NSString *eventDateCorrectFormate= [NSString stringWithFormat:@"%@",
                                                    [dateFormatter stringFromDate:yourDate]];
                
                
                
                
                NSString *eventpic=[dict valueForKey:@"event_pic"];
                NSString *starttime=[dict valueForKey:@"start_time"];
                NSString *endtime=[dict valueForKey:@"end_time"];
                
                NSString *lat=[dict valueForKey:@"latitude"];
                
                NSString *lon=[dict valueForKey:@"longitude"];
                
                NSString *description=[dict valueForKey:@"description"];
                
                NSString *totalattend=[NSString stringWithFormat:@"%@",[dict valueForKey:@"total_attend"]];
                
                NSString *idMain= [NSString stringWithFormat:@"%@",[ dict valueForKey:@"id"]];
                
                NSLog(@"idmain %@",idMain);
                
                [arrayNameaAdminEvent addObject:nameEvent];
                [arrayRateAdminEvent addObject:price];
                
                [arrayDateAdminEvent addObject:eventDateCorrectFormate];
                
                [arrayPicAdminEvent addObject:eventpic];
                [arrayStartTimeAdminEvent addObject:starttime];
                [arrayEndTimeAdminEvent addObject:endtime];
                
                [arrayDescriptionAdminEvent addObject:description];
                
                [arraylatAdminEvent addObject:lat];
                
                [arraylonAdminEvent addObject:lon];
                
                [arrayTotalAttend addObject:totalattend];
                
                [arrayidAdminEvent addObject:idMain];
                
                [arrayAddressAdminEvent addObject:addressEvent];
                
                [arrayMaxAttend addObject:maxAttend];
                
            }
            
            [_tableViewAdminDashboard reloadData];
            
            
            
            
        }
    }];
}

- (IBAction)buttonNewEventAction:(id)sender {
    
    
    
    [self eventgetAllApi];
    
    
    
}


- (IBAction)buttonOkAction:(id)sender {
    
    
    _customViewPopUp.hidden=YES;
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"hidepopupmessage"];
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"heyy%d",x1);
    if (x1 == 1) {
        [UIView animateWithDuration:0.4 animations:^{
            _viewMenuDashBoard.frame=CGRectMake(-417,self.viewMenuDashBoard.frame.origin.y,self.viewMenuDashBoard.frame.size.width,self.viewMenuDashBoard.frame.size.height);
            //            _transperant_view.frame=CGRectMake(-500,self.transperant_view.frame.origin.y,self.transperant_view.frame.size.width,self.transperant_view.frame.size.height);
            
            
            //            _transperant_view.hidden=YES;
            NSLog(@"right");
        }];
        x1=0;
    }
}


@end
