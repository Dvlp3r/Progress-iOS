//
//  BaseVC.m
//  Chyc
//
//  Created by Nitin Bansal on 04/03/16.
//  Copyright (c) 2016 Apple. All rights reserved.
//

#import "BaseVC.h"
#import "HttpObject.h"
#import "AppDelegate.h"
#import "Reachability.h"


@interface BaseVC ()
{
    
    
}

@end


@implementation BaseVC

-(void)onPreExecute:(id)object forRT:(NSString *)rt{
    
}
-(BOOL)onSuccess:(id)object forRT:(NSString *)rt andParamObject:(HttpObject *)params{
    NSLog(@"success response %@", rt);
    return YES;
}
-(void)onFailure:(HttpObject *)paramObject forRT:(NSString *)rt{
    NSLog(@"failure response %@", rt);
}

-(HttpObject *)getHttpObject:(NSString *)pageUrl forTaskCode:(NSString *)taskCode{
    HttpObject *http = [[HttpObject alloc]initWithUrl:pageUrl withTaskCode:taskCode];
    return http;
}
-(void)executeTask:(HttpObject *)http{
    if ([self checkinternet]) {
        
        
        DownloadManager *manager = [[DownloadManager alloc]initWithParamObject:http withDelegate:self andTaskCode:http.taskCode];
        [manager startDownload];
    }
}
-(void)executeTask:(NSString *)pageUrl forTaskCode:(NSString *)taskCode{
    HttpObject *http = [self getHttpObject:pageUrl forTaskCode:taskCode];
    [self executeTask:http];
}
-(void)startHudAnimating{
    [self startHudAnimating:@"Loading..."];
}

-(void)startHudAnimating:(NSString *)msg{
    
    
}
-(void)updateplaceHolderColor:(UITextField*)txt color:(UIColor*)color placeholdertext:(NSString*)Placeholdertext
{
    txt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:Placeholdertext attributes:@{NSForegroundColorAttributeName: color}];
    
}
-(void)stopHudAnimating{
    
}
-(void)showAlert:(NSString *)msg
{
    UIAlertView*alert=[[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    
}
- (UIViewController*)classExistsInNavigationController:(Class)class
{
    for (UIViewController *controller in self.navigationController.viewControllers)
    {
        if ([controller isKindOfClass:class])
        {
            return controller;
        }
    }
    return nil;
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
-(double)getPercentage:(double)totalamount amountpercent:(double)amountPercent
{
    return   (totalamount * amountPercent)/100;
    
}

-(BOOL)internetActive
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    if(internetStatus == NotReachable)
    {
        return NO;
    }//END if(internetStatus == NotReachable)
    
    else {
        return YES;
    }//END Else Statement
}

-(BOOL)checkinternet
{
    if ([self internetActive]) {
        return true;
    }
    else
    {
        UIAlertView *alertview=[[UIAlertView alloc]
                                initWithTitle:@""
                                message:@"No Network Available"
                                delegate:self
                                cancelButtonTitle:@"OK"
                                
                                otherButtonTitles:nil];
        
        [alertview show];
        
        [self stopHudAnimating];
        return false;
    }
}
@end
