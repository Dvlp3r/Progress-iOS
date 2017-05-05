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
#import "ICETutorialPage.h"
#import "ICETutorialStyle.h"
#import "ICETutorialController.h"
#import "KIImagePager.h"



@interface ViewController ()<ICETutorialControllerDelegate,KIImagePagerDelegate, KIImagePagerDataSource>
{
//ICETutorialController* tutorialController;
NSMutableArray* imagesforKIImagePager;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View didLoad called");
//    [_labelTextShow setNumberOfLines:0];
//    
//    [_labelTextShow setLineBreakMode:NSLineBreakByWordWrapping];
//    [_labelTextShow sizeToFit];
    
    _ImagePager.slideshowTimeInterval = 5.5f;
    _ImagePager.slideshowShouldCallScrollToDelegate = YES;
    dispatch_async(dispatch_get_main_queue(), ^{
        _ImagePager.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:(0.0/255.0) green:(230.0/255.0) blue:(215.0/255.0) alpha:1.0];
        _ImagePager.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    });
    _ImagePager.imageCounterDisabled =YES;
    _ImagePager.bounces = NO;
    _ImagePager.delegate =self;
    _ImagePager.dataSource = self;

    
}

- (NSArray *) arrayWithImages:(KIImagePager*)pager
{
    NSLog(@"arrayWithImages called");
    imagesforKIImagePager = [[NSMutableArray alloc]init];
    [imagesforKIImagePager addObject:[UIImage imageNamed:@"splash_bg.png"]];
    [imagesforKIImagePager addObject:[UIImage imageNamed:@"eventfirst.png"]];
    [imagesforKIImagePager addObject:[UIImage imageNamed:@"Stone.png"]];
    
    return imagesforKIImagePager;
}


- (void)imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
    
}

-(void)imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
    NSLog(@"%lu",(unsigned long)index);

    if (index == 0) {
        _screen1Title.hidden = NO;
        _screen1Detail.hidden = NO;
        _screen2Detail.hidden = YES;
        _screen3Detail.hidden = YES;
    }
    else if (index == 1) {
        _screen1Title.hidden = YES;
        _screen1Detail.hidden = YES;
        _screen2Detail.hidden = NO;
        _screen3Detail.hidden = YES;
    }
    else if (index == 2) {
        _screen1Title.hidden = YES;
        _screen1Detail.hidden = YES;
        _screen2Detail.hidden = YES;
        _screen3Detail.hidden = NO;
    }
    
}


- (UIViewContentMode) contentModeForImage:(NSUInteger)image inPager:(KIImagePager *)pager
{
    return UIViewContentModeScaleAspectFill;
}




//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    
//    
//    ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithTitle:@""
//                                                            subTitle:@""
//                                                         pictureName:@"splash_bg.png"
//                                                            duration:3.0];
//    ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithTitle:@""
//                                                            subTitle:@""
//                                                         pictureName:@"Stone.png"
//                                                            duration:3.0];
//    ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithTitle:@""
//                                                            subTitle:@""
//                                                         pictureName:@"eventfirst.png"
//                                                            duration:3.0];
//        NSArray *tutorialLayers = @[layer1,layer2,layer3];
//    
//    // Set the common style for the title.
//    ICETutorialLabelStyle *titleStyle = [[ICETutorialLabelStyle alloc] init];
//    [titleStyle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17.0f]];
//    [titleStyle setTextColor:[UIColor whiteColor]];
//    [titleStyle setLinesNumber:1];
//    [titleStyle setOffset:180];
//    [[ICETutorialStyle sharedInstance] setTitleStyle:titleStyle];
//    
//    // Set the subTitles style with few properties and let the others by default.
//    [[ICETutorialStyle sharedInstance] setSubTitleColor:[UIColor whiteColor]];
//    [[ICETutorialStyle sharedInstance] setSubTitleOffset:150];
//    
//    // Init tutorial.
//    tutorialController = [[ICETutorialController alloc] initWithPages:tutorialLayers
//                                                              delegate:self];
//    
//    [self presentViewController:tutorialController animated:YES completion:^{
//        [tutorialController startScrolling];
//    }];
//    // Run it.
//    
//    
//    
//}

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
        
//    NSString *ForgetScreen=[[NSUserDefaults standardUserDefaults]objectForKey:@"ForgetScreen"];
//    //ForgetScreen = @"1";
//    if ([ForgetScreen isEqualToString:@"1"]) {
//        
//        UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        
//        UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"DeepLinkForgetPasswordViewController"];
//        
//        [self.navigationController pushViewController:obj animated:true];
//        
//        
//    }else{
    
        
        
        
        
        
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
        
  //  }
    
    
}



- (IBAction)buttonProgressAction:(id)sender {
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *obj=[str instantiateViewControllerWithIdentifier:@"LoginViewViewControllers"];
    
    [self.navigationController pushViewController:obj animated:true];
    
    
}

//#pragma mark - ICETutorialController delegate
//- (void)tutorialController:(ICETutorialController *)tutorialController scrollingFromPageIndex:(NSUInteger)fromIndex toPageIndex:(NSUInteger)toIndex {
//    NSLog(@"Scrolling from page %lu to page %lu.", (unsigned long)fromIndex, (unsigned long)toIndex);
//}
//
//- (void)tutorialControllerDidReachLastPage:(ICETutorialController *)tutorialController {
//    NSLog(@"Tutorial reached the last page.");
//}
//
//- (void)tutorialController:(ICETutorialController *)tutorialController didClickOnLeftButton:(UIButton *)sender {
//    NSLog(@"Button 1 pressed.");
//}
//
//- (void)tutorialController:(ICETutorialController *)tutorialController didClickOnRightButton:(UIButton *)sender {
//    NSLog(@"Button 2 pressed.");
//    NSLog(@"Auto-scrolling stopped.");
//    
//    [tutorialController stopScrolling];
//}

@end
