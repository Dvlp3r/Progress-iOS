//
//  ViewController.h
//  Events
//
//  Created by user on 1/31/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICETutorialController.h"
#import "KIImagePager.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *ScreenOne;

@property (weak, nonatomic) IBOutlet UIView *screenTwo;

@property (weak, nonatomic) IBOutlet UIView *screenThree;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIButton *buttonProgress;


@property (strong, nonatomic) IBOutlet UILabel *labelTextShow;


@property (weak, nonatomic) IBOutlet KIImagePager *ImagePager;



@end

