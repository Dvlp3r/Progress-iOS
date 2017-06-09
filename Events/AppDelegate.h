//
//  AppDelegate.h
//  Events
//
//  Created by user on 1/31/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "DashBoradViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    
    UIViewController *Device_view;
    UINavigationController *navigationController;


    
    
    
}
@property (strong, nonatomic) JASidePanelController *sidePanelObj;

@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, strong) UINavigationController *navController;







@end

