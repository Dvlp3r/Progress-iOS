//
//  ProfileAccountViewController.h
//  Events
//
//  Created by user on 2/10/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileAccountViewController : UIViewController<UIImagePickerControllerDelegate, UITabBarDelegate, UIActionSheetDelegate, UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;

@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldContactNo;


@property (weak, nonatomic) IBOutlet UIImageView *imageViewProfilePic;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;




@end
