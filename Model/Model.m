//
//  Model.m
//  AlertApp
//
//  Created by rv-apple on 23/11/16.
//  Copyright © 2016 Rvtech. All rights reserved.
//

#import "Model.h"

@implementation Model

Model* sharedInstance;
+(Model*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
        
    });
    return sharedInstance;
    
}



@end
