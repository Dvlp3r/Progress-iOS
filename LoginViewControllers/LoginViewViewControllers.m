//
//  LoginViewViewControllers.m
//  Events
//
//  Created by user on 3/1/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "LoginViewViewControllers.h"
#import "ForgetPasswordViewController.h"
#import "DashBoradViewController.h"
#import "Model.h"
#import "Constant.h"
#import "NSString+Validation.h"

#import "AdminDashboardViewController.h"

@interface LoginViewViewControllers ()

@end

@implementation LoginViewViewControllers

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *userName=[[NSUserDefaults standardUserDefaults]objectForKey:@"username1"];
    
    NSString *password=[[NSUserDefaults standardUserDefaults]objectForKey:@"Password"];
    
    
    __textFieldUserNameLogin.text=userName;
    
    __textFieldPasswordLogin.text=password;
//
    
    _indicatorLogin.hidden=YES;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    _vwCredentials.layer.shadowColor = [UIColor whiteColor].CGColor;
    _vwCredentials.layer.shadowOpacity = 1;
    _vwCredentials.layer.shadowOffset = CGSizeZero;
    _vwCredentials.layer.shadowRadius = 10;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
-(void)loginApi:(NSString *)username password:(NSString *)password{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:username forKey:@"username"];
    [dict setValue:password forKey:@"password"];
    [self executeTask:[APIGenerator loginApi:dict]];
}

-(void)onPreExecute:(id)object forRT:(NSString *)rt{
    _indicatorLogin.hidden=NO;
    [_indicatorLogin startAnimating];
}

-(BOOL)onSuccess:(id)object forRT:(NSString *)rt andParamObject:(HttpObject *)params{
    _indicatorLogin.hidden=YES;
    [_indicatorLogin stopAnimating];
    [super onSuccess:object forRT:rt andParamObject:params];
    if([Login_url isEqualToString:rt]){
        [self onLoginResponseReceived:object];
    }
    return YES;
}

-(void)onFailure:(HttpObject *)paramObject forRT:(NSString *)rt{
    _indicatorLogin.hidden=YES;
    [_indicatorLogin stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


#pragma gesture methods

-(void)dismissKeyboard {
    
    [__textFieldUserNameLogin resignFirstResponder];
    
    [__textFieldPasswordLogin resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == __textFieldUserNameLogin) {
        
        [__textFieldUserNameLogin resignFirstResponder];
        [__textFieldPasswordLogin becomeFirstResponder];
    }
    else if (textField==__textFieldPasswordLogin) {
        
        [__textFieldPasswordLogin resignFirstResponder];
        
        [__textFieldPasswordLogin setReturnKeyType:UIReturnKeyDone];
        [__textFieldPasswordLogin addTarget:self
                                     action:@selector(textFieldFinished:)
                           forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    return YES;
}
- (IBAction)textFieldFinished:(id)sender
{
    [__textFieldPasswordLogin resignFirstResponder];
    
}


- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}


- (IBAction)buttonForgetPasswordAction:(id)sender {
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"ForgetPasswordViewController"];
    
    [self.navigationController pushViewController:obj animated:true];
    
}

- (IBAction)buttobLoginAction:(id)sender {
    
    //    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //
    //    UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
    //
    //    [self.navigationController pushViewController:obj animated:true];
    
    
    NSString *trimmedEmail = [__textFieldUserNameLogin.text removeWhiteSpace:__textFieldUserNameLogin.text];
    
    NSString *trimmedPassword = [__textFieldPasswordLogin.text removeWhiteSpace:__textFieldPasswordLogin.text];
    
    // BOOL isemailValid = [trimmedEmail validateEmail:trimmedEmail];
    
    
    if ([trimmedEmail isEqualToString:@""]||[trimmedPassword isEqualToString:@""]) {
        
        
        [self callAlert:@"Warning" message:@"All the Fields are Mandatory"];
        
        
    }else if ([trimmedPassword length]<6){
        
        [self callAlert:@"Warning" message:@"Password should not be less than 6 digit"];
    }
    else{
        
        
        //        _buttonLogin.userInteractionEnabled=false;
        
        
        [[NSUserDefaults standardUserDefaults]setObject:__textFieldUserNameLogin.text forKey:@"username1"];
        
        [[NSUserDefaults standardUserDefaults]setObject:__textFieldPasswordLogin.text forKey:@"Password"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //        [self callLoginApi:__textFieldUserNameLogin.text Password:__textFieldPasswordLogin.text];
        [self loginApi:__textFieldUserNameLogin.text password:__textFieldPasswordLogin.text];
    }
    
}

-(void)onLoginResponseReceived:(NSDictionary *)json{
    
    NSLog(@"%@",json);
    NSArray *errors = [json objectForKey:@"errors"];
    
    if (errors!=nil) {
        [self showAlert:@"Incorrect username or password"];
    }else{
        [self saveToken:[json objectForKey:@"access_token"]];
        
        NSLog(@"access token %@",[Model sharedInstance].accessToken);
        
        NSArray *valueData = [json objectForKey:@"user"];
        
        NSLog(@"%@ data",valueData);
        
        NSArray *username1=[valueData valueForKey:@"username"];
        
        NSString *role =   [NSString stringWithFormat:@"%@",[valueData valueForKey:@"role"]];
        
        NSString *contact=[valueData valueForKey:@"contact"];
        
        NSString *email1=[valueData valueForKey:@"email"];
        
        NSString *profilepic=[valueData valueForKey:@"profile_pic"];
        
        if ([profilepic isKindOfClass:[NSNull class]]){
            profilepic=@"";
        }
        [self saveLoginData:username1 contact:contact email:email1 role:role image:profilepic];
        NSString *roleAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"role"];
        if ([roleAdmin isEqualToString:@"1"]) {
            [self moveToAdminDashboard];
        }else{
            [self moveToUserDashboard];
        }
        __textFieldUserNameLogin.text=nil;
        
        __textFieldPasswordLogin.text=nil;
        
        
    }
    
    
    
    
}

-(void)saveToken:(NSString *)token{
    [Model sharedInstance].accessToken= token;
    [[NSUserDefaults standardUserDefaults]setObject:token forKey:@"accessToken"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)saveLoginData:(NSArray *)username contact:(NSString *)contact email:(NSString *)email role:(NSString *)role image:(NSString *)image{
    [[NSUserDefaults standardUserDefaults]setObject:username forKey:@"username1"];
    //   [[NSUserDefaults standardUserDefaults]setObject:_textFieldPassword.text forKey:@"Password"];
    [[NSUserDefaults standardUserDefaults]setObject:contact forKey:@"contact"];
    [[NSUserDefaults standardUserDefaults]setObject:email forKey:@"email"];
    [[NSUserDefaults standardUserDefaults]setObject:role forKey:@"role"];
    [[NSUserDefaults standardUserDefaults]setObject:image forKey:@"imageProfile"];
    [[NSUserDefaults standardUserDefaults]synchronize];
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
    DashBoradViewController *objHomeVC=[sb instantiateViewControllerWithIdentifier:@"CalendarViewController"];
    self.sidePanelObj = [[JASidePanelController alloc]init];
    self.sidePanelObj.shouldDelegateAutorotateToVisiblePanel = NO;
    self.sidePanelObj.leftPanel = [sb instantiateViewControllerWithIdentifier:@"menuView"];
    self.sidePanelObj.centerPanel = [[UINavigationController alloc] initWithRootViewController:objHomeVC];
    [[[UIApplication sharedApplication].delegate window] setRootViewController:self.sidePanelObj];
}


-(void)callLoginApi:(NSString *)email Password:(NSString *)password {
    
    _indicatorLogin.hidden=NO;
    [_indicatorLogin startAnimating];
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,Login_url];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *username_ = @"username=";
    
    NSString *password_ = @"&password=";
    
    NSString *concatenate1 = [username_ stringByAppendingString:email];
    
    NSString *concatenate2 = [password_ stringByAppendingString:password];
    
    NSString *concatenate3 = [concatenate1 stringByAppendingString:concatenate2];
    
    
    //NSString *post = [URL stringByAppendingString:stringWithoutSpaces];
    NSData *postData = [concatenate3 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        [_indicatorLogin stopAnimating];
        _indicatorLogin.hidden=YES;
        
        
        if(data!=nil){
            
            
            NSError *jsonError;
            
            NSData *objectData = [noti dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            NSLog(@"%@",json);
            
            
            
            
            NSArray *errors = [json objectForKey:@"errors"];
            
            if (errors!=nil) {
                
                
                [self callAlert:@"Warning" message:@"Incorrect username or password"];
                
                
            }
            
            
            
            else{
                
                [Model sharedInstance].accessToken= [json objectForKey:@"access_token"];
                
                NSLog(@"access token %@",[Model sharedInstance].accessToken);
                
                NSArray *valueData = [json objectForKey:@"user"];
                
                NSLog(@"%@ data",valueData);
                
                NSArray *username1=[valueData valueForKey:@"username"];
                
                NSString *role =   [NSString stringWithFormat:@"%@",[valueData valueForKey:@"role"]];
                
                [[NSUserDefaults standardUserDefaults]setObject:role forKey:@"role"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                
                NSString *contact=[valueData valueForKey:@"contact"];
                
                NSString *email1=[valueData valueForKey:@"email"];
                
                NSString *profilepic=[valueData valueForKey:@"profile_pic"];
                
                if ([profilepic isKindOfClass:[NSNull class]]){
                    
                    NSString *data1=@"";
                    
                    [[NSUserDefaults standardUserDefaults]setObject:data1 forKey:@"imageProfile"];
                    
                    
                    
                    
                }
                
                else{
                    
                    [[NSUserDefaults standardUserDefaults]setObject:profilepic forKey:@"imageProfile"];
                    
                    
                    
                }
                
                
                
                
                
                //   [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(setButtonEnabled) userInfo:nil repeats:NO];
                
                
                [[NSUserDefaults standardUserDefaults]setObject:username1 forKey:@"username1"];
                
                //   [[NSUserDefaults standardUserDefaults]setObject:_textFieldPassword.text forKey:@"Password"];
                
                
                
                
                
                
                [[NSUserDefaults standardUserDefaults]setObject:contact forKey:@"contact"];
                
                [[NSUserDefaults standardUserDefaults]setObject:email1 forKey:@"email"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                
                
                NSString *roleAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"role"];
                if ([roleAdmin isEqualToString:@"1"]) {
                    
                    
                    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"hidepopupmessage"];
                    [[NSUserDefaults standardUserDefaults]synchronize];
                    
                    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"AdminDashboardViewController"];
                    
                    [self.navigationController pushViewController:vc animated:YES];
                    
                    
                    
                    
                }else{
                    
                    
                    
                    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CalendarViewController"];
                    
                    [self.navigationController pushViewController:vc animated:YES];
                    
                    
                    
                }
                
                
                __textFieldUserNameLogin.text=nil;
                
                __textFieldPasswordLogin.text=nil;
                
                
                
                
                
                
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

- (IBAction)buttonSignUpAction:(id)sender {
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    
    [self.navigationController pushViewController:obj animated:true];
    
    
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField==__textFieldPasswordLogin) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y -120., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
        
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (textField==__textFieldPasswordLogin) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y +120., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}



@end
