//
//  FirstScreenViewController.m
//  Events
//
//  Created by user on 2/2/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "FirstScreenViewController.h"
#import "LoginViewViewControllers.h"
#import "SignUpViewController.h"

@interface FirstScreenViewController ()

@end

@implementation FirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (IBAction)buttonLoginAction:(id)sender {
    
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    [self.navigationController pushViewController:obj animated:true];
    
}

- (IBAction)buttonSignUpAction:(id)sender {
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    
    [self.navigationController pushViewController:obj animated:true];

    
}



@end
