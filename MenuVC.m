//
//  MenuVC.m
//  Osoeasy
//
//  Created by Apple on 12/09/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "MenuVC.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
@interface MenuVC ()
{
    NSArray *arrayData,*arrayImages;
}
@end

@implementation MenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *roleAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"role"];
    if ([roleAdmin isEqualToString:@"1"]) {
        arrayData=[NSArray arrayWithObjects:@"Dashboard",@"Create Events",@"Logout" ,nil];
        arrayImages=[NSArray arrayWithObjects:@"account",@"my_events",@"logout-512.png" ,nil];
    }
    else
    {
        arrayData=[NSArray arrayWithObjects:@"Events",@"My Events",  @"Account", @"Support",@"Logout" ,nil];
        arrayImages=[NSArray arrayWithObjects:@"events",@"my_events",  @"account", @"2017-03-3",@"logout-512.png" ,nil];

    }
   
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}

- (float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    // This will create a "invisible" footer
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.backgroundColor=[UIColor whiteColor];
    cell.textLabel.textColor=[UIColor blackColor];
    cell.textLabel.text =[arrayData objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[arrayImages objectAtIndex:indexPath.row]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    tableView.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;

    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:238/255.0 green:239.0/255.0 blue:240.0/255.0 alpha:1.0];
    [cell setSelectedBackgroundView:bgColorView];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


        if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Events"])
    {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
        
       self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:vc];

    }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"My Events"])

    {
       
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MyEventCreateViewController"];

         self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:vc];
    }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Account"])
    {
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ProfileAccountViewController"];
         self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:vc];
    }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Support"])
    {
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

    }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Dashboard"])
  {
      UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
      
      UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"AdminDashboardViewController"];
      
      self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:vc];


  }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Create Events"])
  {
      [[NSUserDefaults standardUserDefaults] setValue:@"2" forKey:@"Createventdataedit"];
      UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
      
      UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CreateEventScreenViewController"];
      self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:vc];
      
  }
/*    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Directory"])
  {
      
      ResidentsVC *objEasyPollViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ResidentsVC"];
      objEasyPollViewController.strClassType = @"Directory";

      self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:objEasyPollViewController];
      
  }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Residents"])
  {
      ResidentsVC *objEasyPollViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ResidentsVC"];
      objEasyPollViewController.strClassType = @"Resident";

      self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:objEasyPollViewController];
      
  }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Notice Board"])
  {
      
      EasyPollViewController *objEasyPollViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"easyPollView"];
      objEasyPollViewController.strType = @"Notice";
      self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:objEasyPollViewController];
      
  }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Invitation"])
  {
      ProfileViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"profileView"];
      obj.strType =@"Invite";
      self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:obj];
  }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Videos"])
  {
      ViideoViewController *obj=[[ViideoViewController alloc] initWithNibName:@"ViideoViewController" bundle:nil];
      obj.strtype =@"Videos";

self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:obj];
  }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Photos"])
    {
        ViideoViewController *obj=[[ViideoViewController alloc] initWithNibName:@"ViideoViewController" bundle:nil];
        obj.strtype =@"Photos";
        self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:obj];
    }
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Complaints"])
  {
      
      
      ProfileViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"profileView"];
      obj.strType =@"complaint";
      self.sidePanelController.centerPanel = [[UINavigationController alloc]initWithRootViewController:obj];
     
  
  }*/
    else  if ([[arrayData objectAtIndex:indexPath.row]  isEqualToString:@"Logout"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert !" message:@"Are you sure want to logout" delegate:self cancelButtonTitle:@"No" otherButtonTitles: @"Yes",nil];
        [alert show];
    }
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
       [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"role"];

        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"LoginViewViewControllers"];
        
        
        
        UINavigationController *menuNavigationController = [[UINavigationController alloc] initWithRootViewController:vc];
        appDelegate.window.rootViewController = menuNavigationController;
    }
}

@end
