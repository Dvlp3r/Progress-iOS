//
//  APIGenerator.m
//  Events
//
//  Created by Nitin Bansal on 06/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "APIGenerator.h"
#import "Model.h"

@implementation APIGenerator

+(HttpObject *)loginApi:(NSMutableDictionary *)params{
    return [self postWithUrlEncoded:params url:Login_url taskCode:Login_url];
}

+(HttpObject *)signupApi:(NSMutableDictionary *)params{
    return [self postWithUrlEncoded:params url:Login_url taskCode:Login_url];
}
+(HttpObject *)getAllEvents:(NSMutableDictionary *)params{
    return [self postWithUrlEncoded:params url:getallevents taskCode:getallevents];
}

+(HttpObject *)bookEvent:(NSMutableDictionary *)params{
    HttpObject *obj = [self postWithUrlEncoded:params url:booktoevent taskCode:booktoevent];
    [obj addAuthHeader];
    return obj;
}

+(HttpObject *)postWithUrlEncoded:(NSMutableDictionary *)params url:(NSString *)url taskCode:(NSString *)taskCode{
    HttpObject *obj = [[HttpObject alloc]initWithUrl:url withTaskCode:taskCode];
    [obj setParams:params];
    [obj setMethod:@"POST"];
    return obj;
}
@end
