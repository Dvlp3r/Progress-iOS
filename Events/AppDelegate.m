//
//  AppDelegate.m
//  Events
//
//  Created by user on 1/31/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"

@import GooglePlaces;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [GMSPlacesClient provideAPIKey:@"AIzaSyAWERnbH-gsqbtz3fXE7WEUH3tNGJTpRLI"];

    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldShowTextFieldPlaceholder = NO;
    //[IQKeyboardManager sharedManager].toolbarTintColor = [UIColor colorWithRed:(18.0/255.0) green:(131/255.0) blue:(151/255.0) alpha:1.0];
    [IQKeyboardManager sharedManager].toolbarTintColor = [UIColor blueColor];
   /* NSString *roleAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"role"];
    if ([roleAdmin isEqualToString:@"1"]) {
        [self moveToAdminDashboard];
    }else{
        [self moveToUserDashboard];
    }*/
    //[[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    
    // Override point for customization after application launch.
    
//    UIApplication *mySafari = [UIApplication sharedApplication];
//    NSURL *myURL = [[NSURL alloc]initWithString:@"http://www.mydomain.com"];
//    [mySafari openURL:myURL];
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey: @"profilepicchangeCheck"];
//    [[NSUserDefaults standardUserDefaults]synchronize];

    
    return YES;
}
-(void)moveToAdminDashboard{
    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"hidepopupmessage"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    /*   UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"AdminDashboardViewController"];
     [self.navigationController pushViewController:vc animated:YES];
     */
    UIViewController *objHomeVC=[sb instantiateViewControllerWithIdentifier:@"AdminDashboardViewController"];
    self.sidePanelObj = [[JASidePanelController alloc]init];
    self.sidePanelObj.shouldDelegateAutorotateToVisiblePanel = NO;
    self.sidePanelObj.leftPanel = [sb instantiateViewControllerWithIdentifier:@"menuView"];
    self.sidePanelObj.centerPanel = [[UINavigationController alloc] initWithRootViewController:objHomeVC];
    [[[UIApplication sharedApplication].delegate window] setRootViewController:self.sidePanelObj];
}

-(void)moveToUserDashboard{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    /* UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
     [self.navigationController pushViewController:vc animated:YES];*/
    UIViewController *objHomeVC=[sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
    self.sidePanelObj = [[JASidePanelController alloc]init];
    self.sidePanelObj.shouldDelegateAutorotateToVisiblePanel = NO;
    self.sidePanelObj.leftPanel = [sb instantiateViewControllerWithIdentifier:@"menuView"];
    self.sidePanelObj.centerPanel = [[UINavigationController alloc] initWithRootViewController:objHomeVC];
    [[[UIApplication sharedApplication].delegate window] setRootViewController:self.sidePanelObj];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"onForground");
   }


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
    NSLog(@"URL scheme:%@", [url scheme]);
    
    NSString *changePasswordUrl=[NSString stringWithFormat:@"%@",url];
    NSLog(@"%@ changePasswordUrl",changePasswordUrl);

    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"ForgetScreen"];

    [[NSUserDefaults standardUserDefaults]setObject:changePasswordUrl forKey:@"changePasswordUrl"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    NSString *ForgetScreen=[[NSUserDefaults standardUserDefaults]objectForKey:@"ForgetScreen"];
    
    if ([ForgetScreen isEqualToString:@"1"]) {
        
        UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        Device_view = [str instantiateViewControllerWithIdentifier:@"DeepLinkForgetPasswordViewController"];
        
        navigationController=[[UINavigationController alloc] initWithRootViewController:Device_view];

        navigationController.navigationBarHidden = YES;
        [self.window addSubview:Device_view.view];
        self.window.rootViewController =nil;
        self.window.rootViewController = navigationController;
        [self.window makeKeyAndVisible];
        
       // [self.navController pushViewController:obj animated:true];
        
//          _navController =  _window.rootViewController;
        
//        [self.navController pushViewController:obj animated:true];
        
    }

    return YES;
}



@end
