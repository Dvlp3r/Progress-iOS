//
//  NSString+Validation.h
//  PlayMart
//
//  Created by IOS-DEV on 11/05/16.
//  Copyright © 2016 PlayMartApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)


-(BOOL)validateEmail:(NSString *)email;
-(NSString *)removeWhiteSpace:(NSString *)string;

@end
