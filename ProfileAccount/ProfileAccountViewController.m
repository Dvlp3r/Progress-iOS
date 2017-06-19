//
//  ProfileAccountViewController.m
//  Events
//
//  Created by user on 2/10/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ProfileAccountViewController.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
#import "NSString+Validation.h"
#import "DashBoradViewController.h"
#import "Constant.h"




@interface ProfileAccountViewController (){
    
    
    UIImage *selectedImage;
    
}

@end

@implementation ProfileAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _indicator.hidden=YES;
    self.navigationItem.title =@"Profile";
    
//    NSString *profilepicchangeCheck=[[NSUserDefaults standardUserDefaults]objectForKey:@"profilepicchangeCheck"];
    NSString *profilepicchangeCheck = @"1";
    NSString *imageProfile=[[NSUserDefaults standardUserDefaults] objectForKey:@"imageProfile"];
    
    
    
    if ([profilepicchangeCheck isEqualToString:@"1"]) {
        
        NSString *imageUrl = [@"http://54.209.19.2/api/profilepics/" stringByAppendingString:imageProfile];
        
        
             [_imageViewProfilePic sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
//        _imageViewProfilePic.image
        
//        NSData* data = [imageProfile dataUsingEncoding:NSUTF8StringEncoding];
//        
//        _imageViewProfilePic.image=[UIImage imageWithData:data];
//        
//        _imageViewProfilePic.image=[UIImage imageNamed:@"imageDummy"];

        
        
        
        _imageViewProfilePic.layer.backgroundColor=[[UIColor clearColor] CGColor];
        
        
        _imageViewProfilePic.layer.cornerRadius=self.imageViewProfilePic.frame.size.width / 2;
        _imageViewProfilePic.layer.borderWidth=3.0;
        _imageViewProfilePic.layer.masksToBounds = YES;
        
        _imageViewProfilePic.layer.borderColor=[[UIColor whiteColor] CGColor];
        
        
        
        NSString *userName=[[NSUserDefaults standardUserDefaults]objectForKey:@"username1"];
        
        NSString *contact=[[NSUserDefaults standardUserDefaults]objectForKey:@"contact"];
        
        NSString *email=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
        
        _textFieldUserName.text=userName;
        _textFieldEmail.text=email;
        _textFieldContactNo.text=contact;
        
    }else{
        
        _imageViewProfilePic.image=[UIImage imageNamed:@"imageDummy"];
    
    
    _imageViewProfilePic.layer.backgroundColor=[[UIColor clearColor] CGColor];
    
    
    _imageViewProfilePic.layer.cornerRadius=self.imageViewProfilePic.frame.size.width / 2;
    _imageViewProfilePic.layer.borderWidth=3.0;
    _imageViewProfilePic.layer.masksToBounds = YES;
    
    _imageViewProfilePic.layer.borderColor=[[UIColor whiteColor] CGColor];
    
    
    NSString *userName=[[NSUserDefaults standardUserDefaults]objectForKey:@"username1"];
    
    NSString *contact=[[NSUserDefaults standardUserDefaults]objectForKey:@"contact"];
    
    NSString *email=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    
    _textFieldUserName.text=userName;
    _textFieldEmail.text=email;
    _textFieldContactNo.text=contact;
    
   
        
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

- (IBAction)buttonUpdateAction:(id)sender {
    
    
    [self uploadPhoto:_imageViewProfilePic.image];

    
    
}


- (IBAction)buttonOpenCamera:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil
                                                             delegate: self
                                                    cancelButtonTitle: @"Cancel"
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: @"Take a new photo",
                                  @"Choose from existing", nil];
    
    [actionSheet showInView:self.view];
    
    
}

- (IBAction)buttonBackAction:(id)sender {
    
    
    
    [self.navigationController popViewControllerAnimated:true];
    
}




- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSInteger i = buttonIndex;
    
    switch(i) {
            
        case 0:
        {
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *pickerView =[[UIImagePickerController alloc]init];
                pickerView.allowsEditing = YES;
                pickerView.delegate = self;
                pickerView.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:pickerView animated:true];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Device has no camera."
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];            }
            
        }
            break;
        case 1:
        {
            UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
            pickerView.allowsEditing = YES;
            pickerView.delegate = self;
            [pickerView setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self presentModalViewController:pickerView animated:YES];
        }
            
        default:
            break;
            
    }
}








//- (UIImage*)imageWithImage:(UIImage*)image
//              scaledToSize:(CGSize)newSize;
//{
//    newSize.width=550;
//    newSize.height=950;
//    UIGraphicsBeginImageContext(newSize);
//    
//    //x=0 (because widhth : 320) y=0 (aboveImageController's empty part's start)
//    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    NSLog(@"this is image%@",newImage);
//    
//    return newImage;
//}




//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//
//
//
//
//    NSURL *mediaUrl;
//
//    mediaUrl = (NSURL *)[info valueForKey:UIImagePickerControllerMediaURL];
//
//    if (mediaUrl == nil) {
//
//        selectedImage = (UIImage *) [info valueForKey:UIImagePickerControllerEditedImage];
//        if (selectedImage == nil) {
//
//            selectedImage= (UIImage *) [info valueForKey:UIImagePickerControllerOriginalImage];
//            NSLog(@"Original image picked.");
//
//        }
//        else {
//
//            NSLog(@"Edited image picked.");
//
//        }
//
//        _imageViewEditPicture.image=selectedImage;
//
//
//        CLCloudinary *cloudinary = [[CLCloudinary alloc] initWithUrl: @"cloudinary://918791757128321:8RUYVjWnToPF8MKGgsWvzzR-4TY@icarusapp"];
//
//
//        CLUploader* uploader = [[CLUploader alloc] init:cloudinary delegate:self];
//
//        NSData* pictureData = UIImageJPEGRepresentation(_imageViewEditPicture.image,0.0365);
//
//        NSLog(@"image size %@",pictureData);
//
//        //    NSString *imageFilePath = [[NSBundle mainBundle] pathForResource:@"logo" ofType:@"png"];
//
//        [uploader upload:pictureData options:@{}];
//
//
//    }
//
//    [picker dismissViewControllerAnimated:YES completion:nil];
//
//   // img=1;
//
//
//    _imageViewEditPicture.image = selectedImage;
//
//    _imageViewBackground.image=selectedImage;
//
//    [self dismissViewControllerAnimated:YES completion:^{
//
//    }];
//
//
//    self.imageViewEditPicture.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//
//
//}

- (UIImage*)imageWithImage:(UIImage*)image andWidth:(CGFloat)width andHeight:(CGFloat)height
{
    UIGraphicsBeginImageContext( CGSizeMake(width, height));
    [image drawInRect:CGRectMake(0,0,width,height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext() ;
    return newImage;
}

#pragma mark- UIImageController delegate

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    
//    
//    self.imageViewProfilePic.image=image;
//    
//    [self dismissModalViewControllerAnimated:YES];
//
//    
////    selectedImage= [  image;
//    
////    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
////    editor.delegate = self;
////    
////    [picker pushViewController:editor animated:YES];
//    
//    
//}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  //  [SVProgressHUD showWithStatus:@"Uploading..." maskType:SVProgressHUDMaskTypeBlack];
    NSLog(@"Picker returned successfully.");
    
    
    
    NSURL *mediaUrl;
    
    mediaUrl = (NSURL *)[info valueForKey:UIImagePickerControllerMediaURL];
    
    if (mediaUrl == nil) {
        
        selectedImage = (UIImage *) [info valueForKey:UIImagePickerControllerEditedImage];
        if (selectedImage == nil) {
            
            selectedImage= (UIImage *) [info valueForKey:UIImagePickerControllerOriginalImage];
            NSLog(@"Original image picked.");
            
        }
        else {
            
            NSLog(@"Edited image picked.");
            
        }
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
   // [SVProgressHUD dismiss];
//    img=1;
    _imageViewProfilePic.image = selectedImage;
    
}


#pragma gesture methods

-(void)dismissKeyboard {
    
    [_textFieldUserName resignFirstResponder];
    
    
    [_textFieldContactNo resignFirstResponder];
    [_textFieldEmail resignFirstResponder];
    
    
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField==_textFieldContactNo) {
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y -120., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (textField==_textFieldContactNo) {
        
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
        [_textFieldContactNo becomeFirstResponder];
    }
 
    
    
    
    
    else if (textField==_textFieldContactNo){
        
        
        [_textFieldContactNo setReturnKeyType:UIReturnKeyDone];
        [_textFieldContactNo addTarget:self
                              action:@selector(textFieldFinished:)
                    forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    return YES;
}
- (IBAction)textFieldFinished:(id)sender
{
    [_textFieldContactNo resignFirstResponder];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField==_textFieldContactNo) {
        NSString *newString = [_textFieldContactNo.text stringByReplacingCharactersInRange:range withString:string];
        return !([newString length] > 10);
    }else{
        return YES;
    }
    
}


-(void)uploadPhoto :(UIImage*)image{
    
//    [SVProgressHUD showWithStatus:@"Please Wait..." maskType:SVProgressHUDMaskTypeBlack];
    
    _indicator.hidden=NO;
    
    [_indicator startAnimating];
    
    
    NSMutableDictionary*aParametersDic;
    NSMutableDictionary*aImageDic;
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,updateprofile];
    NSURL *url = [NSURL URLWithString:URL];
    NSMutableURLRequest *request= [[NSMutableURLRequest alloc] initWithURL:url] ;
    aParametersDic = [[NSMutableDictionary alloc] init];
    
    if([Model sharedInstance].accessToken.length>0)
    {
        NSString * barrer_token=@"Bearer ";
        barrer_token=[barrer_token stringByAppendingString:[Model sharedInstance].accessToken];
        [request setValue:barrer_token forHTTPHeaderField:@"Authorization"];
        NSString * barrer_token2=@"application/json";
        [request setValue:barrer_token2 forHTTPHeaderField:@"Accept"];
        
    }
    [aParametersDic setObject:_textFieldUserName.text forKey:@"username"];
    [aParametersDic setObject:_textFieldEmail.text forKey:@"email"];
    [aParametersDic setObject:_textFieldContactNo.text forKey:@"contact"];
    [request setURL:url];
    aImageDic = [[NSMutableDictionary alloc]init];
    
    CGFloat scaleSize = 0.2f;
    UIImage *smallImage = [UIImage imageWithCGImage:image.CGImage
                                              scale:scaleSize
                                        orientation:image.imageOrientation];
    
    NSData *imageData = UIImageJPEGRepresentation(smallImage, 0.035);
    
    if(imageData){
        [aImageDic setObject:imageData forKey:[NSString stringWithFormat:@"image%d.jpg",0]];
    }
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *postbody = [NSMutableData data];
    NSString *postData = [self getHTTPBodyParamsFromDictionary:aParametersDic boundary:boundary];
    [postbody appendData:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [aImageDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if(obj != nil)
        {
            [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"profile_pic\"; filetype=\"image/png\"; filename=\"%@\"\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
            [postbody appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            [postbody appendData:[NSData dataWithData:obj]];
            
        }
    }];
    
    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:postbody];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               
                               
                               if(response != nil){
                                   NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
                                   
                                   NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   
                                   
                                   
                                   if ([httpResponse statusCode] == 200) {
                                       
                                       NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                       NSLog(@"%@",requestReply);
                                   //    [SVProgressHUD dismiss];
                                       
                                       
                                       [_indicator stopAnimating];

                                       _indicator.hidden=YES;
                                       
                                       
                                       
                                       NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                       
                                       NSArray *error = [result valueForKey:@"errors"];
                                       
                                       
                                       NSArray *emailrepeat=[error valueForKey:@"email"];
                                       
                                       NSArray *emailRepear1=[emailrepeat objectAtIndex:0];
                                       
                                       NSArray *usernamerepeat=[error valueForKey:@"username"];
                                       
                                       NSArray *usernamerepeat1=[usernamerepeat objectAtIndex:0];
                                       
                                       NSArray *contactRepeat=[error valueForKey:@"contact"];
                                       
                                       NSArray *contactRepeat1=[contactRepeat objectAtIndex:0];

                                       if ([emailRepear1 isEqual:@"The email has already been taken."]) {
                                           
                                           
                                           [self callAlert:@"Warning" message:@"The email has already been taken."];
                                           
                                           
                                           _textFieldUserName.text=nil;
                                           _textFieldEmail.text=nil;
                                           _textFieldContactNo.text=nil;
                                           
                                           
                                           
                                       }else if ([usernamerepeat1 isEqual:@"The username has already been taken."]){
                                           
                                           
                                           [self callAlert:@"Warning" message:@"The username has already been taken."];
                                           
                                           
                                           _textFieldUserName.text=nil;
                                           _textFieldEmail.text=nil;
                                           _textFieldContactNo.text=nil;
                                           
                                           
                                       }
                                       
                                       else if ([contactRepeat1 isEqual:@"The contact has already been taken."]){
                                           
                                           
                                           [self callAlert:@"Warning" message:@"The contact has already been taken."];
                                           
                                           
                                           _textFieldUserName.text=nil;
                                           _textFieldEmail.text=nil;
                                           _textFieldContactNo.text=nil;
                                           
                                           
                                       }
                                       else{
                                       
                                       NSArray *Message = [result valueForKey:@"message"];
                                       
                                       
                                           NSString *imageProfile = [result valueForKey:@"new_image"];
                                           
                                           [[NSUserDefaults standardUserDefaults]setObject:imageProfile forKey:@"imageProfile"];

//                                       [[NSUserDefaults standardUserDefaults]setObject:image forKey:@"imageProfileChange"];
                                       
                                           
                                           
                                       [[NSUserDefaults standardUserDefaults]setObject:_textFieldUserName.text forKey:@"username1"];
                                       
                                       //   [[NSUserDefaults standardUserDefaults]setObject:_textFieldPassword.text forKey:@"Password"];
                                       
                                       [[NSUserDefaults standardUserDefaults]setObject:_textFieldContactNo.text forKey:@"contact"];
                                       
                                       [[NSUserDefaults standardUserDefaults]setObject:_textFieldEmail.text forKey:@"email"];
                                           
                                           
                                       
                                       [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"profilepicchangeCheck"];
                                       [[NSUserDefaults standardUserDefaults]synchronize];
                                           
                                           UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                           
                                           UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashBoradViewController"];
                                           
                                           [self.navigationController pushViewController:vc animated:YES];
                                       
                                       if([Message isEqual:@"success"]){
                                           
                
//                                           [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"profilepicchange"];
//                                           [[NSUserDefaults standardUserDefaults]synchronize];
                                           
                                           
                                           [self callAlert:@"Message" message:@"Update Successfully"];
                                           
                                           
                                           
                                           
                                           
                                           
                                       //    [SVProgressHUD dismiss];
                                           
//                                           SCLAlertView *alert = [[SCLAlertView alloc] init];
//                                           UIColor *color = [UIColor colorWithRed:255.0/255.0 green:38.0/255.0 blue:28.0/255.0 alpha:1.0];
//                                           [alert showCustom:self image:[UIImage imageNamed:@"success_icon"] color:color title:@"Success!!" subTitle:@"Your data have been successfully posted" closeButtonTitle:@"OK" duration:1.5f];
//                                           
//                                           double delayInSeconds = 1.5f;
//                                           dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//                                           dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//                                               
//                                               CATransition* transition = [CATransition animation];
//                                               transition.duration = 0.5f;
//                                               transition.type = kCATransitionReveal;
//                                               transition.subtype = kCATransitionFromLeft;
//                                               [self.navigationController.view.layer addAnimation:transition
//                                                                                           forKey:kCATransition];
//                                               [self.navigationController popViewControllerAnimated:YES];
//                                               
//
//                                           });
                                       }
                                       }
                                       
//                                       else if([Message isEqualToString:@"failure"]){
//                                           
//                                         //  [SVProgressHUD dismiss];
//                                           UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
//                                                                     @"Error" message:@"Error" delegate:self
//                                                                                    cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                                           [alertView show];
//                                           
//                                       }
                                       
                                       
                                   }
                               }
                               
                               
                           }];
    
}

- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    newSize.width=550;
    newSize.height=950;
    UIGraphicsBeginImageContext(newSize);
    
    //x=0 (because widhth : 320) y=0 (aboveImageController's empty part's start)
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSLog(@"this is image%@",newImage);
    
    return newImage;
}
-(NSString *) getHTTPBodyParamsFromDictionary: (NSDictionary *)params boundary:(NSString *)boundary
{
    NSMutableString *tempVal = [[NSMutableString alloc] init];
    for(NSString * key in params)
    {
        [tempVal appendFormat:@"\r\n--%@\r\n", boundary];
        [tempVal appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@",key,[params objectForKey:key]];
    }
    return [tempVal description];
}


-(void)callAlert:(NSString *)Title message:(NSString *)Message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction  = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}




@end
