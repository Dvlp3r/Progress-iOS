//
//  CreateEventScreenViewController.m
//  Events
//
//  Created by user on 2/11/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "CreateEventScreenViewController.h"
#import "Constant.h"
#import "NSString+Validation.h"
#import "UIImageView+WebCache.h"
#import "Model.h"
#import "MyEventCreateViewController.h"
#import "AdminDashboardViewController.h"
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface CreateEventScreenViewController ()<UITextFieldDelegate>{
    
    UIImage *selectedImage;
    UIDatePicker* datePicker;
    NSDateFormatter* dateFormatter;
}

@end

@implementation CreateEventScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd-MMM-yyyy";

    
    datePicker = [UIDatePicker new];
    _txtEventDate.delegate = self;
    self.txtEventDate.inputView  = datePicker;
    NSString *Createventdataedit=[[NSUserDefaults standardUserDefaults]objectForKey:@"Createventdataedit"];
    
    if ([Createventdataedit isEqualToString:@"1"]) {
        
        
       // _buttonSubmit.hidden=NO;
        
        
        _buttonCreateEvent.hidden=YES;

        
        NSString *valueStartTimeAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueStartTimeAdmin"];
        NSString *valueEndTimeAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueEndTimeAdmin"];
        NSString *address=[[NSUserDefaults standardUserDefaults]objectForKey:@"address"];
        NSString *valuelatAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuelatAdmin"];
        NSString *valuelonAdmin=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuelonAdmin"];
        
        
        NSString *valueName=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueNameAdmin"];
        NSString *valuePrice=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuePriceAdmin"];
        NSString *valueImage=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueImageAdmin"];
        NSString *valueDate=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueDateAdmin"];
        NSString *valueDescription=[[NSUserDefaults standardUserDefaults]objectForKey:@"valuedescriptionAdmin"];
        
        NSString  *MaxAttendEvent=[[NSUserDefaults standardUserDefaults]objectForKey:@"MaxAttendEvent"];
        
        NSString *valueTotalAteend=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueTotalAttend"];
        
        
        NSString *imageUrl = [@"http://122.180.254.6/progressbackend/public/eventpics/" stringByAppendingString:valueImage];
        
        
        [_imageViewEventImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
      //  _textFieldSelectPrice.text=valuePrice;
        
        _labelEventDate.text=valueDate;
        _textFieldEventDescription.text=valueDescription;
        
        _textFieldEventName.text=valueName;
        
        
        _textFieldSelectMaxAttendes.text=MaxAttendEvent;
        
        _labelStartTime.text=valueStartTimeAdmin;
        
        _labelEndTime.text=valueEndTimeAdmin;
        
        
        
        double value=[valuelatAdmin floatValue];
        double value2=[valuelonAdmin floatValue];
        // 1
        CLLocationCoordinate2D zoomLocation;
        zoomLocation.latitude = value;
        zoomLocation.longitude= value2;
        
        // 2
        //    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        //
        //    // 3
        //    [_mapKitObject setRegion:viewRegion animated:YES];
        
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(value, value2);
        
        MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
        MKCoordinateRegion region = {coord, span};
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:coord];
        
        [self.mapViewEventLocation setRegion:region];
        [self.mapViewEventLocation addAnnotation:annotation];
        
        
    }else{
    
   // _buttonSubmit.hidden=YES;
    
    _buttonCreateEvent.hidden=NO;
        
    }
    
    _mapViewEventLocation.hidden=YES;
    _indicatorEvent.hidden=YES;
    
    //_datePickerView.hidden=YES;
    
   // _datePickerViewBackground.hidden=YES;
    
    _viewstartTimeBackground.hidden=YES;
    
    _viewEndTimeBackground.hidden=YES;
    
    _SearchBarLocation.hidden=YES;
    
    _viewdatetimeHidder.hidden=YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonOpenCameraAction:(id)sender {
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil
                                                             delegate: self
                                                    cancelButtonTitle: @"Cancel"
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: @"Take a new photo",
                                  @"Choose from existing", nil];
    
    [actionSheet showInView:self.view];
    
    
}

- (IBAction)backButton:(id)sender {
    
    
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
    _imageViewEventImage.image = selectedImage;
    
}


#pragma gesture methods

-(void)dismissKeyboard {
    
    [_textFieldEventName resignFirstResponder];
        
    [_textFieldEventDescription resignFirstResponder];
    
  //  _datePickerViewBackground.hidden=YES;
    
    _viewstartTimeBackground.hidden=YES;
    
    _viewEndTimeBackground.hidden=YES;
    
    _mapViewEventLocation.hidden=YES;

    _SearchBarLocation.hidden=YES;

  //  [_textFieldSelectPrice resignFirstResponder];
    
    [_textFieldSelectMaxAttendes resignFirstResponder];
    
    _viewdatetimeHidder.hidden=YES;
    
    
}







- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    UIBarButtonItem *doItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doDone)];
//    self.navigationItem.rightBarButtonItem = doItem;

    
    [toolBar setItems:@[doItem]];
    
    
    _textFieldSelectMaxAttendes.inputAccessoryView = toolBar;
    
    //_textFieldSelectPrice.inputAccessoryView=toolBar;
    
    
    if (textField==_textFieldEventDescription) {
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y -120., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}

-(void) doDone{
    
    [_textFieldSelectMaxAttendes resignFirstResponder];
    
    //[_textFieldSelectPrice resignFirstResponder];

    
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (textField==_textFieldEventDescription) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y +120., self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == _textFieldEventName) {
        
        [_textFieldEventName resignFirstResponder];
        [_textFieldEventDescription becomeFirstResponder];
    }
   
    
    
    
    
    
    else if (textField==_textFieldEventDescription){
        
        
        [_textFieldEventDescription setReturnKeyType:UIReturnKeyDone];
        [_textFieldEventDescription addTarget:self
                                action:@selector(textFieldFinished:)
                      forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    return YES;
}
- (IBAction)textFieldFinished:(id)sender
{
    [_textFieldEventDescription resignFirstResponder];
    
}


//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    
//    if (textField==_textFieldContactNo) {
//        NSString *newString = [_textFieldContactNo.text stringByReplacingCharactersInRange:range withString:string];
//        return !([newString length] > 10);
//    }else{
//        return YES;
//    }
//    
//}


-(void)uploadPhoto :(UIImage*)image{
    
    //    [SVProgressHUD showWithStatus:@"Please Wait..." maskType:SVProgressHUDMaskTypeBlack];
    
    _indicatorEvent.hidden=NO;
    
    [_indicatorEvent startAnimating];

    
    NSString *fulladdressevent=[[NSUserDefaults standardUserDefaults]objectForKey:@"fulladdressevent"];
    NSString *eventlat=[[NSUserDefaults standardUserDefaults]objectForKey:@"eventlat"];

    NSString *eventlong=[[NSUserDefaults standardUserDefaults]objectForKey:@"eventlong"];
    
    NSString *dateStartString=[[NSUserDefaults standardUserDefaults]objectForKey:@"dateStartString"];

    
    NSString *dateEndString=[[NSUserDefaults standardUserDefaults]objectForKey:@"dateEndString"];
    
    
    NSMutableDictionary*aParametersDic;
    NSMutableDictionary*aImageDic;
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,addevent];
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
    [aParametersDic setObject:_textFieldEventName.text forKey:@"name"];
    [aParametersDic setObject:_textFieldEventDescription.text forKey:@"description"];
    
    [aParametersDic setObject:fulladdressevent forKey:@"address"];
    [aParametersDic setObject:eventlong forKey:@"longitude"];
    [aParametersDic setObject:eventlat forKey:@"latitude"];

    
    [aParametersDic setObject:_labelEventDate.text forKey:@"event_date"];
    [aParametersDic setObject:dateStartString forKey:@"start_time"];
    [aParametersDic setObject:dateEndString forKey:@"end_time"];
    
    [aParametersDic setObject:_textFieldSelectMaxAttendes.text forKey:@"max_attend"];

    
    //[aParametersDic setObject:_textFieldSelectPrice.text forKey:@"price"];

   

    
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
            [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"event_pic\"; filetype=\"image/png\"; filename=\"%@\"\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
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
                                       
                                       
                                       [_indicatorEvent stopAnimating];
                                       
                                       
                                       _indicatorEvent.hidden=YES;
                                       
                                       
                                       NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                       
                                       NSArray *message=[result objectForKey:@"message"];
                                       
                                       
                                       if ([message isEqual:@"Success"]) {
                                           
                                           
                                           UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                           
                                           UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"AdminDashboardViewController"];
                                           
                                           [self.navigationController pushViewController:vc animated:YES];
                                       }
                                       
//                                       NSArray *error = [result valueForKey:@"error"];
//                                       
//                                       
//                                       NSArray *emailrepeat=[error valueForKey:@"email"];
//                                       
//                                       NSArray *emailRepear1=[emailrepeat objectAtIndex:0];
//                                       
//                                       NSArray *usernamerepeat=[error valueForKey:@"username"];
//                                       
//                                       NSArray *usernamerepeat1=[usernamerepeat objectAtIndex:0];
//                                       
//                                       NSArray *contactRepeat=[error valueForKey:@"contact"];
//                                       
//                                       NSArray *contactRepeat1=[contactRepeat objectAtIndex:0];
                                       
//                                       if ([emailRepear1 isEqual:@"The email has already been taken."]) {
//                                           
//                                           
//                                           [self callAlert:@"Warning" message:@"The email has already been taken."];
//                                           
//                                           
////                                           _textFieldEventName.text=nil;
////                                           _textFieldEventDescription.text=nil;
//                                           
//                                           
//                                           
//                                       }else if ([usernamerepeat1 isEqual:@"The username has already been taken."]){
                                       
//                                           
//                                           [self callAlert:@"Warning" message:@"The username has already been taken."];
//                                           
////                                           
////                                           _textFieldUserName.text=nil;
////                                           _textFieldEmail.text=nil;
////                                           _textFieldContactNo.text=nil;
                                       
                                           
                                   //    }
                                       
//                                       else if ([contactRepeat1 isEqual:@"The contact has already been taken."]){
//                                           
//                                           
//                                           [self callAlert:@"Warning" message:@"The contact has already been taken."];
//                                           
//                                           
////                                           _textFieldUserName.text=nil;
////                                           _textFieldEmail.text=nil;
////                                           _textFieldContactNo.text=nil;
//                                           
//                                           
//                                       }
                                      // else{
                                           
//                                           NSArray *Message = [result valueForKey:@"message"];
//                                           
//                                           
//                                           NSString *imageProfile = [result valueForKey:@"new_image"];
//                                           
//                                           [[NSUserDefaults standardUserDefaults]setObject:imageProfile forKey:@"imageProfile"];
                                       
                                           //                                       [[NSUserDefaults standardUserDefaults]setObject:image forKey:@"imageProfileChange"];
         
//                                           
//                                           if([Message isEqual:@"success"]){
//                                               
//                                               
//                                               //                                           [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"profilepicchange"];
//                                               //                                           [[NSUserDefaults standardUserDefaults]synchronize];
//                                               
//                                               
//                                               [self callAlert:@"Message" message:@"Update Successfully"];
                                       
                                               
                                               
                                               
                                               
                                               
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
                                          // }
                                      // }
                                       
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


-(void)uploadPhotoedit :(UIImage*)image{
    
    //    [SVProgressHUD showWithStatus:@"Please Wait..." maskType:SVProgressHUDMaskTypeBlack];
    
    _indicatorEvent.hidden=NO;
    
    [_indicatorEvent startAnimating];
    
    
    NSString *fulladdressevent=[[NSUserDefaults standardUserDefaults]objectForKey:@"fulladdressevent"];
    NSString *eventlat=[[NSUserDefaults standardUserDefaults]objectForKey:@"eventlat"];
    
    NSString *eventlong=[[NSUserDefaults standardUserDefaults]objectForKey:@"eventlong"];
    
    NSString *dateStartString=[[NSUserDefaults standardUserDefaults]objectForKey:@"dateStartString"];
    
    
    NSString *dateEndString=[[NSUserDefaults standardUserDefaults]objectForKey:@"dateEndString"];
    
    NSString *valueidAttend=[[NSUserDefaults standardUserDefaults]objectForKey:@"valueidAttend"];

    
    
    NSMutableDictionary*aParametersDic;
    NSMutableDictionary*aImageDic;
    NSString *URL = [NSString stringWithFormat:@"%@%@",Api_Server_Url,addevent];
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
    [aParametersDic setObject:_textFieldEventName.text forKey:@"name"];
    [aParametersDic setObject:_textFieldEventDescription.text forKey:@"description"];
    
    [aParametersDic setObject:fulladdressevent forKey:@"address"];
    [aParametersDic setObject:eventlong forKey:@"longitude"];
    [aParametersDic setObject:eventlat forKey:@"latitude"];
    
    
    [aParametersDic setObject:_labelEventDate.text forKey:@"event_date"];
    [aParametersDic setObject:dateStartString forKey:@"start_time"];
    [aParametersDic setObject:dateEndString forKey:@"end_time"];
    
    [aParametersDic setObject:_textFieldSelectMaxAttendes.text forKey:@"max_attend"];
    
    
    //[aParametersDic setObject:_textFieldSelectPrice.text forKey:@"price"];
    
    [aParametersDic setObject:valueidAttend forKey:@"id"];

    
    
    
    
    
    
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
            [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"event_pic\"; filetype=\"image/png\"; filename=\"%@\"\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
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
                                       
                                       
                                       [_indicatorEvent stopAnimating];
                                       
                                       
                                       _indicatorEvent.hidden=YES;
                                       
                                       
                                       NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                       
                                       NSArray *message=[result objectForKey:@"message"];
                                       
                                       
                                       if ([message isEqual:@"Success"]) {
                                           
                                           [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"Createventdataedit"];
                                           [[NSUserDefaults standardUserDefaults]synchronize];
                                           
                                           UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                           
                                           UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"AdminDashboardViewController"];
                                           
                                           [self.navigationController pushViewController:vc animated:YES];
                                       }
                                       
                                       //                                       NSArray *error = [result valueForKey:@"error"];
                                       //
                                       //
                                       //                                       NSArray *emailrepeat=[error valueForKey:@"email"];
                                       //
                                       //                                       NSArray *emailRepear1=[emailrepeat objectAtIndex:0];
                                       //
                                       //                                       NSArray *usernamerepeat=[error valueForKey:@"username"];
                                       //
                                       //                                       NSArray *usernamerepeat1=[usernamerepeat objectAtIndex:0];
                                       //
                                       //                                       NSArray *contactRepeat=[error valueForKey:@"contact"];
                                       //
                                       //                                       NSArray *contactRepeat1=[contactRepeat objectAtIndex:0];
                                       
                                       //                                       if ([emailRepear1 isEqual:@"The email has already been taken."]) {
                                       //
                                       //
                                       //                                           [self callAlert:@"Warning" message:@"The email has already been taken."];
                                       //
                                       //
                                       ////                                           _textFieldEventName.text=nil;
                                       ////                                           _textFieldEventDescription.text=nil;
                                       //
                                       //
                                       //
                                       //                                       }else if ([usernamerepeat1 isEqual:@"The username has already been taken."]){
                                       
                                       //
                                       //                                           [self callAlert:@"Warning" message:@"The username has already been taken."];
                                       //
                                       ////
                                       ////                                           _textFieldUserName.text=nil;
                                       ////                                           _textFieldEmail.text=nil;
                                       ////                                           _textFieldContactNo.text=nil;
                                       
                                       
                                       //    }
                                       
                                       //                                       else if ([contactRepeat1 isEqual:@"The contact has already been taken."]){
                                       //
                                       //
                                       //                                           [self callAlert:@"Warning" message:@"The contact has already been taken."];
                                       //
                                       //
                                       ////                                           _textFieldUserName.text=nil;
                                       ////                                           _textFieldEmail.text=nil;
                                       ////                                           _textFieldContactNo.text=nil;
                                       //
                                       //
                                       //                                       }
                                       // else{
                                       
                                       //                                           NSArray *Message = [result valueForKey:@"message"];
                                       //
                                       //
                                       //                                           NSString *imageProfile = [result valueForKey:@"new_image"];
                                       //
                                       //                                           [[NSUserDefaults standardUserDefaults]setObject:imageProfile forKey:@"imageProfile"];
                                       
                                       //                                       [[NSUserDefaults standardUserDefaults]setObject:image forKey:@"imageProfileChange"];
                                       
                                       //
                                       //                                           if([Message isEqual:@"success"]){
                                       //
                                       //
                                       //                                               //                                           [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"profilepicchange"];
                                       //                                               //                                           [[NSUserDefaults standardUserDefaults]synchronize];
                                       //
                                       //
                                       //                                               [self callAlert:@"Message" message:@"Update Successfully"];
                                       
                                       
                                       
                                       
                                       
                                       
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
                                       // }
                                       // }
                                       
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


- (IBAction)datePickerAction:(id)sender {
    
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    
    df.dateFormat = @"dd-MMM-yyyy";
    
  //  _labelEventDate.text = [NSString stringWithFormat:@"%@",
                   //   [df stringFromDate:_datePickerView.date]];
    
    
    
  //  NSLog(@"%@",[df stringFromDate:_datePickerView.date]);

    
}

- (IBAction)buttonOpenDatePickerAction:(id)sender {
    
    _viewdatetimeHidder.hidden=NO;

    
    
//    _datePickerView.hidden=NO;
//    _datePickerViewBackground.hidden=NO;
//    
    

}

- (IBAction)buttonStartTimeAction:(id)sender {
    
    
    _viewdatetimeHidder.hidden=NO;

    
    _viewstartTimeBackground.hidden=NO;
    
    
    
}


- (IBAction)buttonEndTimeAction:(id)sender {
    
    _viewdatetimeHidder.hidden=NO;

    _viewEndTimeBackground.hidden=NO;

    
    
}

- (IBAction)datePickerStartTimeAction:(id)sender {
    
    
    
   
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init]; [outputFormatter setDateFormat:@"HH:mm"];
    NSString *dateStartString = [outputFormatter stringFromDate:self.datePickerStartTime.date];
    
    
    _labelStartTime.text=dateStartString;
    
    [[NSUserDefaults standardUserDefaults]setObject:dateStartString forKey:@"dateStartString"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    df.dateStyle = NSDateFormatterMediumStyle;
//    
//    //[df setDateStyle:NSDateFormatterMediumStyle];
//    [df setDateFormat:@"HH:mm:ss"];
////    NSDate *date1 = [df dateFromString:df];
////    NSLog(@"date1 : %@", df);
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"hh:mm a"];
////    NSLog(@"Current Date: %@", [formatter stringFromDate:date1]);
//    
//    _labelStartTime.text = [NSString stringWithFormat:@"%@",
//                            [df stringFromDate:_datePickerView.timeZone]];
    
    
//    NSDate *currDate = [NSDate date];
//    
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"HH:mm:ss"];
//    
//    NSString *dateString = [dateFormatter stringFromDate:currDate];
//    _labelStartTime.text = [dateFormatter stringFromDate:currDate];
    
    
    
//
//    [[NSUserDefaults standardUserDefaults] setObject:dateString forKey:@"time_backgorund"];
//    [[NSUserDefaults standardUserDefaults] synchronize];

    
}


- (IBAction)datePickerEndTimeAction:(id)sender {
    
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    df.dateStyle = NSDateFormatterMediumStyle;
//    
//    _labelEventDate.text = [NSString stringWithFormat:@"%@",
//                            [df stringFromDate:_datePickerView.timeZone]];
    
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init]; [outputFormatter setDateFormat:@"HH:mm"];
    //NSString *dateEndString = [outputFormatter stringFromDate:seldatePickerStartTimeefaults]setObject:dateEndString forKey:@"dateEndString"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
}

- (IBAction)buttonSelectLocationMapAction:(id)sender {
    
    _mapViewEventLocation.hidden=NO;
    _SearchBarLocation.hidden=NO;
    
    
    float value = 30.7333;
    float value2 = 76.7794;
    
    CLLocationCoordinate2D zoomLocation;
    
    zoomLocation.latitude = value;
    zoomLocation.longitude= value2;
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(value, value2);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = {coord, span};
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coord];
    
    [self.mapViewEventLocation setRegion:region];
    [self.mapViewEventLocation addAnnotation:annotation];
    
    
    
    
}

- (void) searchBarTextDidBeginEditing: (UISearchBar*) searchBar {
    
    
    
    
    
    
    
    //    _tableViewFriendList.hidden=NO;
    
    
    [searchBar setShowsCancelButton: YES animated: YES];
    
}


//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//
//
//    _tableViewFriendList.hidden=YES;
//
//    [searchBar setShowsCancelButton: YES animated: YES];
//
//
//}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
//    
//    NSString *firstLetter= searchBar.text;
//    
////    [[NSUserDefaults standardUserDefaults]setObject:firstLetter forKey:@"firstLetter"];
////    [[NSUserDefaults standardUserDefaults]synchronize];
//    

//    
//    [searchBar resignFirstResponder];
    
    
    
    [_SearchBarLocation resignFirstResponder];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:_SearchBarLocation.text completionHandler:^(NSArray *placemarks, NSError *error) {
        //Error checking
        
        
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        MKCoordinateRegion region;
        region.center.latitude = placemark.region.center.latitude;
        region.center.longitude = placemark.region.center.longitude;
        
        
        NSString *valuelat = [NSString stringWithFormat:@"%f",region.center.latitude];
        NSString *valuelong = [NSString stringWithFormat:@"%f",region.center.longitude];
        
        
        NSLog(@"lat %@ long %@",valuelat,valuelong);
        
        [[NSUserDefaults standardUserDefaults]setObject:valuelat forKey:@"eventlat"];
        
        [[NSUserDefaults standardUserDefaults]setObject:valuelong forKey:@"eventlong"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        NSDictionary *addressDictinary = placemark.addressDictionary;
        
        NSString *mainAddress=[addressDictinary valueForKey:@"FormattedAddressLines"];
        NSLog(@"%@ mainAddress",mainAddress);
        
        
        NSString *name=[addressDictinary valueForKey:@"Name"];
        
        NSLog(@"name %@",name);
        
        NSString *state=[addressDictinary valueForKey:@"State"];
        
        NSLog(@"state %@",state);
        
        NSString *fullAddress=[[name stringByAppendingString:@" "] stringByAppendingString:state];
        
        NSLog(@"fulladdress %@",fullAddress);
        
        _labelSelectLocation.text=fullAddress;
        
        [[NSUserDefaults standardUserDefaults]setObject:fullAddress forKey:@"fulladdressevent"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
//        NSString *sameline=[mainAddress stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
//        
//        NSLog(@"%@ sameline",sameline);
        
        
        NSLog(@"Address %@",addressDictinary);
        
//        NSString *address=[[NSString alloc]initWithString:placemark.addressDictionary];
//        
//        NSLog(@"Address %@",address);
        
        MKCoordinateSpan span;
        double radius = placemark.region.radius / 1000; // convert to km
        
        NSLog(@"[searchBarSearchButtonClicked] Radius is %f", radius);
        span.latitudeDelta = radius / 112.0;
        
        region.span = span;
        
        [_mapViewEventLocation setRegion:region animated:YES];
    }];
    
    
    
    
    // Do the search...
}


- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    searchBar.text=nil;
    
    
}

- (void) zoomMapAndCenterAtLatitude:(double) latitude andLongitude:(double) longitude
{
    MKCoordinateRegion region;
    region.center.latitude  = latitude;
    region.center.longitude = longitude;
    
    //Set Zoom level using Span
    MKCoordinateSpan span;
    span.latitudeDelta  = .005;
    span.longitudeDelta = .005;
    region.span = span;
    
    //Move the map and zoom
    [_mapViewEventLocation setRegion:region animated:YES];
}





- (IBAction)buttonDoneAction:(id)sender {
    
    
    _viewdatetimeHidder.hidden=YES;
    
    _viewEndTimeBackground.hidden=YES;
    
    _viewstartTimeBackground.hidden=YES;
    
    //_datePickerViewBackground.hidden=YES;
    
}


//- (void)keyboardWillShow:(NSNotification *)note {
//    // create custom button
//    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    doneButton.frame = CGRectMake(0, 163, 106, 53);
//    doneButton.adjustsImageWhenHighlighted = NO;
//    [doneButton setImage:[UIImage imageNamed:@"doneButtonNormal.png"] forState:UIControlStateNormal];
//    [doneButton setImage:[UIImage imageNamed:@"doneButtonPressed.png"] forState:UIControlStateHighlighted];
//    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
//    
//    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIView *keyboardView = [[[[[UIApplication sharedApplication] windows] lastObject] subviews] firstObject];
//            [doneButton setFrame:CGRectMake(0, keyboardView.frame.size.height - 53, 106, 53)];
//            [keyboardView addSubview:doneButton];
//            [keyboardView bringSubviewToFront:doneButton];
//            
//            [UIView animateWithDuration:[[note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]-.02
//                                  delay:.0
//                                options:[[note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]
//                             animations:^{
//                                 self.view.frame = CGRectOffset(self.view.frame, 0, 0);
//                             } completion:nil];
//        });
//    }else {
//        // locate keyboard view
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
//            UIView* keyboard;
//            for(int i=0; i<[tempWindow.subviews count]; i++) {
//                keyboard = [tempWindow.subviews objectAtIndex:i];
//                // keyboard view found; add the custom button to it
//                if([[keyboard description] hasPrefix:@"UIKeyboard"] == YES)
//                    [keyboard addSubview:doneButton];
//            }
//        });
//    }
//}

//-(void)textFieldDidBeginEditing:(UITextField *)textField {
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillShow:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//}



- (IBAction)buttonBackAction:(id)sender {
    
    
    
    [self.navigationController popViewControllerAnimated:true];
    
    
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:_txtEventDate]) {
        [datePicker setDatePickerMode:UIDatePickerModeDate];
        [datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];

    }
    return YES;
}

-(void) onDatePickerValueChanged:(UIDatePicker *)picker
{
    _txtEventDate.text = [dateFormatter stringFromDate:datePicker.date];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
