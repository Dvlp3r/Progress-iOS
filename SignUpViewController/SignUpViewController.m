//
//  SignUpViewController.m
//  Events
//
//  Created by user on 2/2/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "SignUpViewController.h"
#import "Constant.h"
#import "NSString+Validation.h"
#import "Model.h"
#import "DashBoradViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _indicator.hidden=YES;
    
    _viewUserName.layer.borderWidth=2.0;
    _viewUserName.layer.masksToBounds = YES;
    _viewUserName.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    _viewEmail.layer.borderWidth=2.0;
    _viewEmail.layer.masksToBounds=YES;
    _viewEmail.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    _viewPassword.layer.borderWidth=2.0;
    _viewPassword.layer.masksToBounds=YES;
    _viewPassword.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    
    _viewContact.layer.borderWidth=2.0;
    _viewContact.layer.masksToBounds=YES;
    _viewContact.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (IBAction)ButtonSignUpAction:(id)sender {
    
    
    
    NSString *trimmedUserName = [_textFieldUserName.text removeWhiteSpace:_textFieldUserName.text];
    
    NSString *trimmedEmail = [_textFieldEmail.text removeWhiteSpace:_textFieldEmail.text];
    
    NSString *trimmedPassword = [_textFieldPassword.text removeWhiteSpace:_textFieldPassword.text];
    
    NSString *trimmedPhone = [_textFieldContact.text removeWhiteSpace:_textFieldContact.text];

    
    BOOL isemailValid = [trimmedEmail validateEmail:trimmedEmail];
    
    if ([trimmedUserName isEqualToString:@""]||[trimmedEmail isEqualToString:@""]||[trimmedPhone isEqualToString:@""]||[trimmedPassword isEqualToString:@""]){
        
        
        [self callAlert:@"Warning" message:@"All the Fields are Mandatory"];
    }else if ([trimmedPhone length] < 10){
        
        [self callAlert:@"Warning" message:@"Number should not be less than 10 digit"];
    }
    
    else if (isemailValid==NO){
        
        [self callAlert:@"Warning" message:@"Check your Email ID Format"];
        
        
    }else if ([trimmedPassword length] < 6){
        
        [self callAlert:@"Warning" message:@"Password must of 6 digit length"];
    }else{
    
        
        [[NSUserDefaults standardUserDefaults]setObject:_textFieldUserName.text forKey:@"username1"];
        
        [[NSUserDefaults standardUserDefaults]setObject:_textFieldPassword.text forKey:@"Password"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        [self callSignUpApi:_textFieldUserName.text email:_textFieldEmail.text Password:_textFieldPassword.text PhoneNo:_textFieldContact.text];
        
        
    }
    
    
}


# pragma mark CallAlert

-(void)callAlert:(NSString *)Title message:(NSString *)Message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction  = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma gesture methods

-(void)dismissKeyboard {
    
    [_textFieldUserName resignFirstResponder];
    
    [_textFieldPassword resignFirstResponder];
    
    [_textFieldContact resignFirstResponder];
    
    [_textFieldEmail resignFirstResponder];

    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField==_textFieldContact) {
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y -120., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (textField==_textFieldContact) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y +120., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == _textFieldUserName) {
        
        [_textFieldUserName resignFirstResponder];
        [_textFieldEmail becomeFirstResponder];
    }
    else if (textField==_textFieldEmail) {
        [_textFieldEmail resignFirstResponder];
        [_textFieldPassword becomeFirstResponder];
    }
    else if (textField==_textFieldPassword){
        [_textFieldPassword resignFirstResponder];
        [_textFieldContact becomeFirstResponder];
    }
    
    
    
    
    else if (textField==_textFieldContact){
        
        
        [_textFieldContact setReturnKeyType:UIReturnKeyDone];
        [_textFieldContact addTarget:self
                           action:@selector(textFieldFinished:)
                 forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    return YES;
}
- (IBAction)textFieldFinished:(id)sender
{
    [_textFieldContact resignFirstResponder];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField==_textFieldContact) {
        NSString *newString = [_textFieldContact.text stringByReplacingCharactersInRange:range withString:string];
        return !([newString length] > 10);
    }else{
        return YES;
    }
    
}


- (IBAction)buttonAlreadyMember:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}

-(void)callSignUpApi:(NSString *)userName email:(NSString *)Email Password:(NSString *)password  PhoneNo:(NSString *)contact {
    
    _indicator.hidden=NO;
    
    [_indicator startAnimating];

    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,Sigup_url];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *username_ = @"username=";
    NSString *email_ = @"&email=";
    NSString *password_ = @"&password=";
    NSString *password_confirmation = @"&password_confirmation=";

    NSString *contact_ = @"&contact=";


    NSString *concatenate1 = [username_ stringByAppendingString:userName];
    NSString *concatenate2 = [email_ stringByAppendingString:Email];
    
    NSString *concatenate3 = [password_ stringByAppendingString:password];
    
    
    NSString *concatenate4 = [password_confirmation stringByAppendingString:_textFieldPassword.text];

    
    NSString *concatenate5 = [contact_ stringByAppendingString:contact];
    
 
    NSString *concatenate6 = [concatenate1 stringByAppendingString:concatenate2];
    NSString *concatenate7 = [concatenate6 stringByAppendingString:concatenate3];
    NSString *concatenate8 = [concatenate7 stringByAppendingString:concatenate4];
    
    NSString *concatenate9 = [concatenate8 stringByAppendingString:concatenate5];
    

    
    //NSString *post = [URL stringByAppendingString:stringWithoutSpaces];
    NSData *postData = [concatenate9 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        
        [_indicator stopAnimating];
        _indicator.hidden=YES;
//        
        if(data!=nil){
  
            
            NSError *jsonError;
            NSData *objectData = [noti dataUsingEncoding:NSUTF8StringEncoding];
            
            
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            NSLog(@"%@",json);
            
            
           
            
            NSArray *error =[json objectForKey:@"errors"];
            
            NSArray *emailrepeat=[error valueForKey:@"email"];
            
            NSArray *emailRepear1=[emailrepeat objectAtIndex:0];
            
            NSArray *usernamerepeat=[error valueForKey:@"username"];
            
            NSArray *usernamerepeat1=[usernamerepeat objectAtIndex:0];
            
            
            if ([emailRepear1 isEqual:@"The email has already been taken."]) {
                
                
                [self callAlert:@"Warning" message:@"The email has already been taken."];
                
                
                _textFieldUserName.text=nil;
                _textFieldEmail.text=nil;
                _textFieldContact.text=nil;
                _textFieldPassword.text=nil;
             
                
            }else if ([usernamerepeat1 isEqual:@"The username has already been taken."]){
                
                
                [self callAlert:@"Warning" message:@"The username has already been taken."];
                
                
                _textFieldUserName.text=nil;
                _textFieldEmail.text=nil;
                _textFieldContact.text=nil;
                _textFieldPassword.text=nil;
                
                
            }
            

            
            
            else{
            
                [Model sharedInstance].accessToken= [json objectForKey:@"access_token"];
                
                NSLog(@"access token %@",[Model sharedInstance].accessToken);
                
                NSArray *valueData = [json objectForKey:@"user"];
                
                NSLog(@"%@ data",valueData);
                
                NSArray *username1=[valueData valueForKey:@"username"];
                
                NSString *contact=[valueData valueForKey:@"contact"];
                
                
               NSString *email1=[valueData valueForKey:@"email"];
                
                
                
                
                
                [[NSUserDefaults standardUserDefaults]setObject:username1 forKey:@"username1"];
                
//                [[NSUserDefaults standardUserDefaults]setObject:_textFieldPassword.text forKey:@"Password"];
                
                [[NSUserDefaults standardUserDefaults]setObject:contact forKey:@"contact"];
                
                [[NSUserDefaults standardUserDefaults]setObject:email1 forKey:@"email"];
                
                [[NSUserDefaults standardUserDefaults]synchronize];
       
                
                
                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
              /*  UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
                
                [self.navigationController pushViewController:vc animated:YES];*/
                
                UIViewController *objHomeVC=[sb instantiateViewControllerWithIdentifier:@"CalendarViewController"];
                self.sidePanelObj = [[JASidePanelController alloc]init];
                self.sidePanelObj.shouldDelegateAutorotateToVisiblePanel = NO;
                self.sidePanelObj.leftPanel = [sb instantiateViewControllerWithIdentifier:@"menuView"];
                self.sidePanelObj.centerPanel = [[UINavigationController alloc] initWithRootViewController:objHomeVC];
                [[[UIApplication sharedApplication].delegate window] setRootViewController:self.sidePanelObj];
                
                
            }
            
            
            
            //                [_pickerViewSelectExperience reloadAllComponents];
            
            
            
            
        }
        
        
        
        
        
        
        
    }];
    
}







@end
