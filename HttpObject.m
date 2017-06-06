//
//  PBParamObject.m
//  Plabro
//
//  Created by VISHAL DHIMAN on 16/06/15.
//  Copyright (c) 2015 Plabro. All rights reserved.
//

#import "HttpObject.h"
#import "Constant.h"

@implementation HttpObject


-(void)addParam:(NSString *)key andValue:(NSString *)value{
    
    [self.params setValue:value forKey:key];
    
}

- (instancetype)initWithUrl:(NSString *)pageUrl withTaskCode:(NSString *)taskCode
{
    self = [super init];
    if (self)
    {
        self.url = Api_Server_Url;
        self.url = [self.url stringByAppendingString:pageUrl];
        self.params = [[NSMutableDictionary alloc]init];
        self.headers = [[NSMutableDictionary alloc]init];
      
        
        self.methodType = @"GET";
        self.taskCode = taskCode;
    }
    return self;
}

-(void)addHeader:(NSString *)key withValue:(NSString *)value{
    [self.headers setValue:value forKey:key];
}
-(void)setMethod:(NSString *)method{
    self.methodType = method;
}
//-(void)setPostJson:(NSMutableDictionary *)jsonDict{
//    self.json = jsonDict;
//}
-(void)setTaskCodeValue:(NSString *)taskCodeValue{
    self.taskCode = taskCodeValue;
}


@end
