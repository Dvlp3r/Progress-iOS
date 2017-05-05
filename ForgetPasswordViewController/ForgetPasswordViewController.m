//
//  ForgetPasswordViewController.m
//  Events
//
//  Created by user on 2/2/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "Constant.h"
#import "NSString+Validation.h"

@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __indicatorEmailForget.hidden=YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)ButtonCancelAction:(id)sender {
    
      [self.navigationController popViewControllerAnimated:true];
    
    
}


#pragma gesture methods


-(void)dismissKeyboard {
    
    [_textFieldEmailForget resignFirstResponder];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == _textFieldEmailForget) {
        
        [_textFieldEmailForget resignFirstResponder];
        
        
        
        [_textFieldEmailForget setReturnKeyType:UIReturnKeyDone];
        [_textFieldEmailForget addTarget:self
                                  action:@selector(textFieldFinished:)
                        forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    return YES;
}
- (IBAction)textFieldFinished:(id)sender
{
    [_textFieldEmailForget resignFirstResponder];
    
}


- (IBAction)buttonSendAction:(id)sender {
    
    NSString *trimmedEmail = [_textFieldEmailForget.text removeWhiteSpace:_textFieldEmailForget.text];
    
    BOOL isemailValid = [trimmedEmail validateEmail:trimmedEmail];
    
    if ([trimmedEmail isEqualToString:@""]) {
        [self callAlert:@"Warning" message:@"The Field are Mandatory"];
    }else if (isemailValid==NO){
        
        [self callAlert:@"Warning" message:@"Check your Email ID Format"];
    }
    
    
    else{
        
        [self callEmailApi:_textFieldEmailForget.text];
        
        //        [self callWebServices:textEmail.text phone_no:textPhone.text];
        
    }

    
}

-(void)callEmailApi:(NSString *)Email {
    
        __indicatorEmailForget.hidden=NO;
        [__indicatorEmailForget startAnimating];
    
    
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,ForgetPassword_url];
    NSURL *theURL = [NSURL URLWithString:URL];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *email = @"email=";
    
    
    NSString *concatenate1 = [email stringByAppendingString:Email];
    
    
    //    NSString *concatenate2 = [concatenate1 stringByAppendingString:concatenate2];
    
    
    
    
    //NSString *post = [URL stringByAppendingString:stringWithoutSpaces];
    
    NSData *postData = [concatenate1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    [theRequest setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // if(data != nil){
        
        NSString *noti = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response:: %@", noti);
        
                [__indicatorEmailForget stopAnimating];
                __indicatorEmailForget.hidden=YES;
        
        
        
        if(data!=nil){
            NSError *jsonError;
            NSData *objectData = [noti dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            NSLog(@"%@",json);
            
            
            NSArray *error = [json objectForKey:@"message"];
            
            if ([error isEqual:@"Email id does not exist"]) {
                
                
                [self callAlert:@"Warning" message:@"Email id does not exist"];
                
                _textFieldEmailForget.text=nil;
                
                
            }
            
            
            else{
                
                
                [self callAlert:@"Message" message:@"Please check your email to reset password"];
                
                _textFieldEmailForget.text=nil;
                
                
                
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
