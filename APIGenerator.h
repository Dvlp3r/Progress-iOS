//
//  APIGenerator.h
//  Events
//
//  Created by Nitin Bansal on 06/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpObject.h"
#import "Constant.h"
@interface APIGenerator : NSObject

+(HttpObject *) loginApi:(NSMutableDictionary *)params;
+(HttpObject *) signupApi:(NSMutableDictionary *)params;
+(HttpObject *) getAllEvents:(NSMutableDictionary *)params;
@end
