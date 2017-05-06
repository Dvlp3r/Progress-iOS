//
//  ViewController.h
//  Events
//
//  Created by user on 1/31/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KIImagePager.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonProgress;
@property (strong, nonatomic) IBOutlet UILabel *screen1Title;
@property (strong, nonatomic) IBOutlet UILabel *screen1Detail;
@property (strong, nonatomic) IBOutlet UILabel *screen2Detail;
@property (strong, nonatomic) IBOutlet UILabel *screen3Detail;
@property (weak, nonatomic) IBOutlet KIImagePager *ImagePager;



@end

