//
//  AttendUserViewController.m
//  Events
//
//  Created by user on 2/23/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AttendUserViewController.h"

#import "AttendUserTableViewCell.h"
#import "Constant.h"
#import "Model.h"

#import "UIImageView+WebCache.h"

@interface AttendUserViewController (){
    
    
    NSMutableArray *arrayUserName;
    
    NSMutableArray *arrayPic;
    
    NSMutableArray *arrayStatus;
    
    NSMutableArray *arrayId;

    
}

@end

@implementation AttendUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayUserName=[[NSMutableArray alloc]init];
    arrayPic = [[NSMutableArray alloc]init];
    
    arrayStatus = [[NSMutableArray alloc]init];
    
    arrayId = [[NSMutableArray alloc]init];

    [self AttendApi];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark TableView Data source and delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return [arrayUserName count];

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

        static NSString *simpleTableIdentifier = @"AttendUserTableViewCell";
        
        AttendUserTableViewCell *cell = (AttendUserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            //        cell = [[FeaturedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
            cell = (AttendUserTableViewCell *)[nib objectAtIndex:0];
            
        }
        
        //cell.imageViewEvent.image=[ev]
    

    
    NSString * tesdata=[arrayStatus objectAtIndex:indexPath.row];
    
    if ([tesdata isEqualToString:@"2"])
    {
     
        NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/profilepics/" stringByAppendingString:[arrayPic objectAtIndex:indexPath.row]];
        
        
        [cell.imageViewCell sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        cell.labelUserNamecell.text=[arrayUserName objectAtIndex:indexPath.row];
        
            cell.buttonMarkAsRead.tag=indexPath.row;
        cell.buttonMarkAsUnread.tag=indexPath.row;

        
        cell.buttonMarkAsRead.hidden=YES;

        cell.buttonMarkAsUnread.hidden=NO;
        
        
            [cell.buttonMarkAsRead addTarget:self action:@selector(buttonMarkAsReadAction:) forControlEvents:UIControlEventTouchUpInside];
          [cell.buttonMarkAsUnread addTarget:self action:@selector(buttonMarkAsUnreadAction:) forControlEvents:UIControlEventTouchUpInside];
  
        
    }
    
    else
    {
        NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/profilepics/" stringByAppendingString:[arrayPic objectAtIndex:indexPath.row]];
        
        
        [cell.imageViewCell sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        cell.labelUserNamecell.text=[arrayUserName objectAtIndex:indexPath.row];
        
        cell.buttonMarkAsRead.tag=indexPath.row;

            cell.buttonMarkAsUnread.tag=indexPath.row;
        
             [cell.buttonMarkAsRead addTarget:self action:@selector(buttonMarkAsReadAction:) forControlEvents:UIControlEventTouchUpInside];
        
                  [cell.buttonMarkAsUnread addTarget:self action:@selector(buttonMarkAsUnreadAction:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.buttonMarkAsUnread.hidden=YES;
        
        cell.buttonMarkAsRead.hidden=NO;

        
        
    }
    

        return cell;
        
 

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 101;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    

    
    
    
}



-(void)buttonMarkAsReadAction:(UIButton *)sender{
    
    
        NSLog(@"%ld",(long)sender.tag);
    
        CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableViewAttendence];
        NSIndexPath *indexPath = [self.tableViewAttendence indexPathForRowAtPoint:buttonPosition];
    
    NSString *valueId=[arrayId objectAtIndex:indexPath.row];
    
    [[NSUserDefaults standardUserDefaults]setObject:valueId forKey:@"valueId"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self  MarkAsReadApi];
    
    


}

-(void)buttonMarkAsUnreadAction:(UIButton *)sender{
    
    
    NSLog(@"%ld",(long)sender.tag);
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableViewAttendence];
    NSIndexPath *indexPath = [self.tableViewAttendence indexPathForRowAtPoint:buttonPosition];
    
    NSString *valueId=[arrayId objectAtIndex:indexPath.row];
    
    [[NSUserDefaults standardUserDefaults]setObject:valueId forKey:@"valueId"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self  MarkAsUnReadApi];
    
}





-(void)AttendApi {
    
    //    _indicatorLogin.hidden=NO;
    //    [_indicatorLogin startAnimating];
    
    
    NSString *valueidAttend = [[NSUserDefaults standardUserDefaults]objectForKey:@"valueidAttend"];
    
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    
    NSString *strBearer = @"Bearer ";
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,getattendedusers];
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
    NSString *concatenate1 = [event_id stringByAppendingString:valueidAttend];
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
            
            [arrayUserName removeAllObjects];
            
            [arrayPic removeAllObjects];
            
            [arrayStatus removeAllObjects];
            
            [arrayId removeAllObjects];
            
            
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
                
                NSString *idValue=[NSString stringWithFormat:@"%@",[dict valueForKey:@"id"]];
                
                
                NSString *status=[NSString stringWithFormat:@"%@",[dict valueForKey:@"status"]];
                
                NSArray *userinfo=[dict valueForKey:@"userinfo"];
                
                NSString *userName=[userinfo valueForKey:@"username"];
                
                NSString *profilepic=[userinfo valueForKey:@"profile_pic"];
                
                
                [arrayUserName addObject:userName];
                
                [arrayPic addObject:profilepic];
                
                [arrayStatus addObject:status];
                
                [arrayId addObject:idValue];
                
                
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
            
            [_tableViewAttendence reloadData];
            
            
        }
    }];
}


-(void)callAlert:(NSString *)Title message:(NSString *)Message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction  = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (IBAction)buttonBackAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

-(void)MarkAsReadApi{
    
    
    
    
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    

    NSString *valueId=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueId"];
    
    //    NSString *valueNotification=[valueArray objectAtIndex:0];
    
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,tomakeattented];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    
    
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    
    NSString *ids=@"id=";
    
    NSString *status=@"&status=";
    
    
    NSString *concatenate1 = [ids stringByAppendingString:valueId];
    NSString *concatenate2 =  [status stringByAppendingString:@"2"];
    
    NSString *concatenate3 = [concatenate1 stringByAppendingString:concatenate2];
    
    NSData *postData = [concatenate3 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data1, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        //        [_indicator stopAnimating];
        //        _indicator.hidden=YES;
        //
        
        if(data1==nil){
            
            //            [self callAlert:@"Warning" message:@"Could not connect to server"];
        }
        
        
        else if(data1!=nil){
            
            
            NSError *jsonError;
            NSData *objectData = [noti dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            NSLog(@"%@",json);
            
            
            NSString *message = [json objectForKey:@"message"];
            
            
            
            if ([message isEqual:@"Success"]) {
                
                [self AttendApi];
                
                //                [self callAlert:@"Message" message:@"Subscribe"];
                
            }
            
            else{
                
                
                //                [self callAlert:@"Warning" message:@"Could Not Connect To Server"];
                
            }
            
        }
    }];
    
    
    
}


-(void)MarkAsUnReadApi{
    
    
    
    
    
    NSString *strAccessToken = [Model sharedInstance].accessToken;
    NSString *strBearer = @"Bearer ";
    
    
    NSString *valueId=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueId"];
    
    //    NSString *valueNotification=[valueArray objectAtIndex:0];
    
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,tomakeattented];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    
    
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setValue:[strBearer stringByAppendingString:strAccessToken] forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    
    NSString *ids=@"id=";
    
    NSString *status=@"&status=";
    
    
    NSString *concatenate1 = [ids stringByAppendingString:valueId];
    NSString *concatenate2 =  [status stringByAppendingString:@"1"];
    
    NSString *concatenate3 = [concatenate1 stringByAppendingString:concatenate2];
    
    NSData *postData = [concatenate3 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data1, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        //        [_indicator stopAnimating];
        //        _indicator.hidden=YES;
        //
        
        if(data1==nil){
            
            //            [self callAlert:@"Warning" message:@"Could not connect to server"];
        }
        
        
        else if(data1!=nil){
            
            
            NSError *jsonError;
            NSData *objectData = [noti dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            NSLog(@"%@",json);
            
            
            NSString *message = [json objectForKey:@"message"];
            
            
            
            if ([message isEqual:@"Success"]) {
                
                  [self AttendApi];
                
                //                [self callAlert:@"Message" message:@"Subscribe"];
                
            }
            
            else{
                
                
                //                [self callAlert:@"Warning" message:@"Could Not Connect To Server"];
                
            }
            
        }
    }];
    
    
    
}



@end
