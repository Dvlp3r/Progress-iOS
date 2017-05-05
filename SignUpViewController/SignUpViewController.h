//
//  SignUpViewController.h
//  Events
//
//  Created by user on 2/2/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewUserName;


@property (weak, nonatomic) IBOutlet UIView *viewEmail;

@property (weak, nonatomic) IBOutlet UIView *viewPassword;

@property (weak, nonatomic) IBOutlet UIView *viewContact;


@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;


@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;


@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;




@property (weak, nonatomic) IBOutlet UITextField *textFieldContact;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end
