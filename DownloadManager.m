//
//  PBDownloadManager.m
//  Plabro
//
//  Created by VISHAL DHIMAN on 16/06/15.
//  Copyright (c) 2015 Plabro. All rights reserved.
//

#import "DownloadManager.h"
#import "RestClient.h"

@implementation DownloadManager

-(instancetype) initWithParamObject:(HttpObject*)obj withDelegate:(id<RestDelegate>) delegate andTaskCode:(NSString*)taskCode{
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.taskCode = taskCode;
        self.customUrl = nil;
        self.params = obj;
    }
    return self;
}

-(void)startDownload{
    [self.delegate onPreExecute:self.params forRT:self.taskCode];
    
    NSMutableString *postString = [[NSMutableString alloc] init];
    for (NSString *key in [self.params.params allKeys]) {
        //        [postString appendString:[NSString stringWithFormat:@"&%@=%@", key, [PBUtils encodeParameterString:[self.params.params objectOrNilForKey:key]]]];
//        NSString *value = [[NSString alloc] initWithData:[self.params.params objectForKey:key] encoding:NSUTF8StringEncoding];
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", key, [self.params.params objectForKey:key]]];
    }
    
    if([@"POST" isEqualToString:self.params.methodType] || [@"PUT" isEqualToString:self.params.methodType]){
        if(self.params.postJsonDict){
            NSError *error ;
            NSData *jsonData=[NSJSONSerialization dataWithJSONObject:self.params.postJsonDict options:NSJSONWritingPrettyPrinted error:&error];
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//            NSString *jsonString = [NSString stringWithFormat:@"%@",jsonData];
            NSLog(@"JSON Data is :%@",jsonString);
            [postString appendString:jsonString];
        }
    }
    
    NSLog(@"URL IS : %@",self.params.url);
    NSString *code = [self.params.url substringFromIndex: [self.params.url length] - 1];
    if ([code isEqualToString:@"?"]) {
        self.params.url =[self.params.url substringToIndex:[self.params.url length] - 1];

    }
    
    self.downloadClient = [[RestClient alloc] initWithHttp:self.params postString:postString completionHandler:^(NSInteger responseCode, NSData *data, NSError *connectionError) {
        @try{
            if (connectionError) {
                NSLog(@"%@", connectionError.debugDescription);
                dispatch_async(dispatch_get_main_queue(), ^(){
                    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
                    [parameters setObject:connectionError.description forKey:@"onFailure"];
                    self.params.status =FAILED_CONNECTION_ERROR;
                    [self.delegate onFailure:self.params forRT:self.taskCode];
                });
                return ;
            }
            
            if (!data) {
                dispatch_async(dispatch_get_main_queue(), ^(){
                    //Add method, task you want perform on mainQueue
                    //Control UIView, IBOutlet all here
                    self.params.status = FAILED_NO_DATA_EXCEPTION;
                    [self.delegate onFailure:self.params forRT:self.taskCode];
                });
                
                return;
            }
            
            NSError *err;
            NSMutableDictionary *respDict=[NSJSONSerialization
                                           JSONObjectWithData:data
                                           options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers
                                           error:&err];
            if (err) {
                NSLog(@"JSON Parsing error: %@", err.debugDescription);
            }
            if (!respDict) {
                dispatch_async(dispatch_get_main_queue(), ^(){
                    //Add method, task you want perform on mainQueue
                    //Control UIView, IBOutlet all here
                    self.params.status = FAILED_PARSE_EXCEPTION;
                    [self.delegate onFailure:self.params forRT:self.taskCode];
                    return;
                });
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^(){
                if (responseCode == 200 || responseCode == 201) {
                    [self.delegate onSuccess:respDict forRT:self.taskCode andParamObject:self.params];
 
                }
                else
                {
                    [self.delegate onFailure:self.params forRT:self.taskCode];
                }
            });
            
        }
        @catch (NSException *exception) {
            NSLog( @"Exception Parsing Download Data. Please check.\n%@", exception.description);
        }
    }];
    [self.downloadClient loadRequest];
}
@end
