//
//  NSString+Validation.m
//  PlayMart
//
//  Created by IOS-DEV on 11/05/16.
//  Copyright © 2016 PlayMartApp. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)


-(BOOL)validateEmail:(NSString *)email{
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

-(NSString *)removeWhiteSpace:(NSString *)string{
    
    NSString *trimmed = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return trimmed;
}


@end
