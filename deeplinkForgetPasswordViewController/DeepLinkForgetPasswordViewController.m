//
//  DeepLinkForgetPasswordViewController.m
//  Events
//
//  Created by user on 2/3/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "DeepLinkForgetPasswordViewController.h"
#import "FirstScreenViewController.h"
#import "Constant.h"
#import "NSString+Validation.h"
#import "Model.h"
#import "ViewController.h"
#import "DashBoradViewController.h"

@interface DeepLinkForgetPasswordViewController (){
    
    
    int j;
    
    
}

@end

@implementation DeepLinkForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    j=0;
    
    
    _indicatorDeepLink.hidden=YES;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    }

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"");
}

#pragma gesture methods

-(void)dismissKeyboard {
    
    [_textFieldNewPassword resignFirstResponder];
    [_textFieldConfirmPassword resignFirstResponder];
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField==_textFieldConfirmPassword) {
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y -70., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (textField==_textFieldConfirmPassword) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y +70., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == _textFieldNewPassword) {
        
        [_textFieldNewPassword resignFirstResponder];
        [_textFieldConfirmPassword becomeFirstResponder];
    }
  
    else if (textField==_textFieldConfirmPassword){
        [_textFieldConfirmPassword resignFirstResponder];
        [_textFieldConfirmPassword setReturnKeyType:UIReturnKeyDone];
        [_textFieldConfirmPassword addTarget:self
                                    action:@selector(textFieldFinished:)
                          forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    return YES;
}
- (IBAction)textFieldFinished:(id)sender
{
    [_textFieldConfirmPassword resignFirstResponder];
    
}






- (IBAction)buttonBackAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}


- (IBAction)buttonSubmitAction:(id)sender {
    
    
//    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"FirstScreenViewController"];
//    
//    [self.navigationController pushViewController:obj animated:true];
    
    
    NSString *trimmedNewPassword = [_textFieldNewPassword.text removeWhiteSpace:_textFieldNewPassword.text];
    NSString *trimmedRepeatPassword = [_textFieldConfirmPassword.text removeWhiteSpace:_textFieldConfirmPassword.text];
    
    
    if ([trimmedNewPassword isEqualToString:@""]||[trimmedRepeatPassword isEqualToString:@""]) {
        [self callAlert:@"Warning" message:@"All the Fields are Mandatory"];
    }
    
    else if ([trimmedNewPassword length]<6 || [trimmedRepeatPassword length]<6){
        [self callAlert:@"Warning" message:@"Password must of 6 digit length"];
        
    }else if ([trimmedNewPassword isEqualToString:trimmedRepeatPassword]){
        
        NSString *idnumber=[[NSUserDefaults standardUserDefaults]objectForKey:@"idnumber"];
        
        NSString *intvaluej=[NSString stringWithFormat:@"%d",j];

        
        if ([idnumber isEqual:intvaluej]) {
            
            [self callAlert:@"Warning" message:@"Session Expired"];
            
        }else{
        
        [self callEmailApi:_textFieldNewPassword.text confirmPassword:_textFieldConfirmPassword.text];
        
        }
    }else{
        [self callAlert:@"Warning" message:@"Repeated Password did not matched"];
    }
    
    
}


-(void)callEmailApi: (NSString *)Password confirmPassword: (NSString *)confirmpassword{
    
    _indicatorDeepLink.hidden=NO;
    [_indicatorDeepLink startAnimating];
    
    
    NSString *changePasswordUrl=[[NSUserDefaults standardUserDefaults]objectForKey:@"changePasswordUrl"];

    NSArray *arr = [changePasswordUrl componentsSeparatedByString:@"progress://"];
    if (arr.count >1) {
        NSString *valueURL = [arr objectAtIndex:1];
        NSArray *arr2 = [valueURL componentsSeparatedByString:@","];
        
        // NSArray *arr3=[valueURL componentsSeparatedByString:@"\n"];
        
        
        if (arr2.count > 0) {
            
            valueURL = [arr2 objectAtIndex:0];
            
            
            
            NSLog(@"%@ valueurl",valueURL);
            
            
            NSArray *idnew=[valueURL componentsSeparatedByString:@"/"];
            
            if (idnew.count>1) {
                
                
                NSString *idnumber=[idnew objectAtIndex:0];
                
                NSLog(@"idnumnber %@",idnumber);

                
                j = [idnumber intValue];
                
//                NSArray *number=[idnumber componentsSeparatedByString:@","];
//                
//                NSLog(@"number %@",number);
                
                NSString *newValue=[idnew objectAtIndex:1];
                
                NSLog(@"%@ idnew",newValue);
                
                [[NSUserDefaults standardUserDefaults]setObject:newValue forKey:@"userid"];
                
                [[NSUserDefaults standardUserDefaults]setObject:idnumber forKey:@"idnumber"];
                
                [[NSUserDefaults standardUserDefaults]synchronize];
                
            }
            
            

            
            
            
         
//            
//            NSString *idnew=[valueURL stringByReplacingOccurrencesOfString:@"/Ng=="
//                                                                withString:@""];
//      
            
           
            
            
        }
        
    }
    
//    NSString *changePasswordUrluserid=[[NSUserDefaults standardUserDefaults]objectForKey:@"changePasswordUrl"];
//    
//    NSArray *arruserid = [changePasswordUrluserid componentsSeparatedByString:@"progress://1012004180/"];
//    
//    if (arruserid.count >1) {
//        
//        NSString *userid = [arruserid objectAtIndex:1];
//        NSArray *arr3 = [userid componentsSeparatedByString:@","];
//        
//        // NSArray *arr3=[valueURL componentsSeparatedByString:@"\n"];
//        
//        
//        if (arr3.count > 0) {
//            
//            userid = [arr3 objectAtIndex:0];
//            
//            
//            NSLog(@"%@ valueurl",userid);
//            
//            
//            
//            [[NSUserDefaults standardUserDefaults]setObject:userid forKey:@"userid"];
//            
//            [[NSUserDefaults standardUserDefaults]synchronize];
//            
//            
//        }
//        
//    }
    
    NSString *mainuserid=[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"];
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,afterforgot];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *password = @"password=";
    
    NSString *password_confirmation = @"&password_confirmation=";
    
    NSString *user_id = @"&user_id=";


    
    
    NSString *concatenate1 = [password stringByAppendingString:Password];
    
    NSString *concatenate2 =[password_confirmation stringByAppendingString:confirmpassword];
    
    NSString *concatenate3 = [user_id stringByAppendingString:mainuserid];
    
    NSString *concatenate4=[concatenate1 stringByAppendingString:concatenate2];
    
    NSString *concatenate5=[concatenate4 stringByAppendingString:concatenate3];

    
    //    NSString *concatenate2 = [concatenate1 stringByAppendingString:concatenate2];
    
    
    //NSString *post = [URL stringByAppendingString:stringWithoutSpaces];
    
    NSData *postData = [concatenate5 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
        [_indicatorDeepLink stopAnimating];
        _indicatorDeepLink.hidden=YES;
        
        if(data!=nil){
            NSError *jsonError;
            NSData *objectData = [noti dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            NSLog(@"%@",json);
            
            [Model sharedInstance].accessToken= [json objectForKey:@"access_token"];
            
            NSLog(@"access token %@",[Model sharedInstance].accessToken);
            
            NSArray *message = [json objectForKey:@"message"];
            
            if ([message isEqual:@"Successfully update your password!"]) {
                
//                
//                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//                
//                UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
////
////                [self.navigationController pushViewController:vc animated:YES];
                
//                [self.navigationController popViewControllerAnimated:true];
                
                [self callAlert:@"Message" message:@"Password changed successfully"];
                
                _textFieldNewPassword.text=nil;
                
                _textFieldConfirmPassword.text=nil;
                
                
                    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"ForgetScreen"];
                    [[NSUserDefaults standardUserDefaults]synchronize];
                
                
//                double delayInSeconds = 1.0f;
//                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                
                    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//                    CATransition* transition = [CATransition animation];
//                    transition.duration = 0.5f;
//                    [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];
//                    transition.type = kCATransitionReveal;
//                    transition.subtype = kCATransitionFromLeft;
//                    [self.navigationController.view.layer addAnimation:transition
//                                                                forKey:kCATransition];
                    [self.navigationController pushViewController:VC animated:NO];
             //   });
                
                
            }
            
            
            else{
                
                
          
                
                
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







@end
