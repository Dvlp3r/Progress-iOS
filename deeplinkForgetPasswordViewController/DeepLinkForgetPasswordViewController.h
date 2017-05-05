//
//  DeepLinkForgetPasswordViewController.h
//  Events
//
//  Created by user on 2/3/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeepLinkForgetPasswordViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *textFieldNewPassword;

@property (weak, nonatomic) IBOutlet UITextField *textFieldConfirmPassword;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorDeepLink;



@end
