//
//  LoginViewViewControllers.h
//  Events
//
//  Created by user on 3/1/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
@interface LoginViewViewControllers : BaseVC

@property (weak, nonatomic) IBOutlet UITextField *_textFieldUserNameLogin;

@property (weak, nonatomic) IBOutlet UITextField *_textFieldPasswordLogin;
@property (strong, nonatomic) JASidePanelController *sidePanelObj;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorLogin;


@property (weak, nonatomic) IBOutlet UIView *vwCredentials;

@end
