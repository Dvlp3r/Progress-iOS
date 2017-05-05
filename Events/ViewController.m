//
//  ViewController.m
//  Events
//
//  Created by user on 1/31/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"
#import "FirstScreenViewController.h"
#import "DeepLinkForgetPasswordViewController.h"
#import "LoginViewViewControllers.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_labelTextShow setNumberOfLines:0];
    
    [_labelTextShow setLineBreakMode:NSLineBreakByWordWrapping];
    [_labelTextShow sizeToFit];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView2 {
//    CGFloat width = scrollView.frame.size.width;
//    CGFloat x1 = scrollView.contentOffset.x;
//    
//    //    NSInteger page = (x1 + (0.5f * width)) / width;
//    
//    NSInteger page = ((x1 - width/2)/width)+1;
//    
//    self.pageControl.currentPage = page;
//    
//    NSLog(@"Page number is %li", (long)page);
//    
//    NSLog(@"%f", scrollView.contentOffset.x);
//    
//    NSLog(@"%f", scrollView.contentOffset.y);
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
        
    NSString *ForgetScreen=[[NSUserDefaults standardUserDefaults]objectForKey:@"ForgetScreen"];
    
    if ([ForgetScreen isEqualToString:@"1"]) {
        
        UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"DeepLinkForgetPasswordViewController"];
        
        [self.navigationController pushViewController:obj animated:true];
        
        
    }else{
        
        
//        [self.buttonProgress.layer setBorderWidth:2.0];
//        _buttonProgress.layer.borderColor= [[UIColor whiteColor]CGColor];
        
        _buttonProgress.layer.cornerRadius = 5;
        
        _buttonProgress.layer.masksToBounds=true;
//        
//        self.scrollView.delaysContentTouches = YES;
//        self.scrollView.canCancelContentTouches = NO;
//        
//        
//        self.automaticallyAdjustsScrollViewInsets=false;
//        scrollView.pagingEnabled = YES;
//        scrollView.directionalLockEnabled = YES;
//        
//        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width*3, scrollView.bounds.size.height);
//        
//        self.pageControl.numberOfPages=3;
//        self.pageControl.currentPage=0;
//        
//        CGRect frame = _ScreenOne.frame;
//        
//        frame.origin.x = 0;
//        
//        
//        CGRect frame1 = _screenTwo.frame;
//        frame1.origin.x= scrollView.frame.size.width;
//        
//        
//        CGRect frame2 = _screenThree.frame;
//        
//        frame2.origin.x = scrollView.frame.size.width+scrollView.frame.size.width;
//        
//        frame.size.width=scrollView.frame.size.width;
//        
//        frame1.size.width=scrollView.frame.size.width;
//        
//        frame2.size.width=scrollView.frame.size.width;
//        
//        
//        
//        frame.origin.y=0;
//        frame1.origin.y=0;
//        frame2.origin.y=0;
//        
//        
//        
//        frame.size.height=scrollView.frame.size.height;
//        
//        frame1.size.height=scrollView.frame.size.height;
//        
//        frame2.size.height=scrollView.frame.size.height;
//        
//        _screenTwo.frame = frame1;
//        _screenThree.frame = frame2;
//        
        
    }
    
    
}



- (IBAction)buttonProgressAction:(id)sender {
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"LoginViewViewControllers"];
    
    [self.navigationController pushViewController:obj animated:true];
    
    
}


@end
