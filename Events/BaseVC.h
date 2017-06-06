#import <UIKit/UIKit.h>
#import "DownloadManager.h"
#import "APIGenerator.h"



@interface BaseVC : UIViewController <RestDelegate>
-(void)executeTask:(HttpObject *)http;
-(HttpObject *)getHttpObject:(NSString *)pageUrl forTaskCode:(NSString *)taskCode;
-(void)executeTask:(NSString *)pageUrl forTaskCode:(NSString *)taskCode;
-(void)showAlert:(NSString *)msg;
-(void)startHudAnimating;
-(void)startHudAnimating:(NSString *)msg;
-(void)stopHudAnimating;
-(BOOL) NSStringIsValidEmail:(NSString *)checkString;
-(double)getPercentage:(double)totalamount amountpercent:(double)amountPercent;
-(void)updateplaceHolderColor:(UITextField*)txt color:(UIColor*)color placeholdertext:(NSString*)Placeholdertext;
-(BOOL)checkinternet;

@end
