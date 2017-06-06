//
//  PBRestClient.m
//  Plabro
//
//  Created by VISHAL DHIMAN on 16/06/15.
//  Copyright (c) 2015 Plabro. All rights reserved.
//

#import "RestClient.h"

@implementation RestClient

-(instancetype)initWithUrlString:(NSString*)urlString postString:(NSString*)postStr methodType:(NSString*)httpMethod completionHandler:(void (^)(NSInteger responseCode, NSData* data, NSError* connectionError)) handler{
    self = [super init];
    if (self) {
        self.postStr = postStr;
        self.urlStr = urlString;
        self.httpMethodType = httpMethod;
        if (handler) {
            self.responseHandler = handler;
        }
        self.resposeStatus = -1;
    }
    
    return self;
}
-(instancetype)initWithHttp:(HttpObject *)httpObject postString:(NSString *)postStr completionHandler:(void (^)(NSInteger, NSData *, NSError *))handler{
    self = [super init];
    if (self) {
        self.httpObject = httpObject;
        self.postStr = postStr;
        self.urlStr = self.httpObject.url;
        self.httpMethodType = self.httpObject.methodType;
        if (handler) {
            self.responseHandler = handler;
        }
        self.resposeStatus = -1;
    }
    
    return self;

}

-(void)stopLoading{
    self.delegate = nil;
    self.responseHandler = nil;
}

-(void)loadRequest{
    
    BOOL isGet = [self.httpMethodType isEqualToString:@"GET"];
    NSString *urlString = @"";
    NSURL *connUrl;
    if(isGet){
     connUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", self.urlStr]];
       
    }else{
        connUrl = [NSURL URLWithString:self.urlStr];
    }

    

    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:connUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];

    if (!isGet) {
        [urlRequest setHTTPMethod:self.httpObject.methodType];
        NSString *postStr = self.postStr;
        [urlRequest setHTTPBody:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }else{
        [urlRequest setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    }
    
    [urlRequest setValue:@"gzip,deflate,sdch" forHTTPHeaderField:@"Accept-Encoding"];
    [urlRequest setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];

    if(self.httpObject){
        for (NSString *key in [self.httpObject.headers allKeys]) {
            [urlRequest setValue:[self.httpObject.headers objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    
    NSLog(@"Loading request: %@%@", self.urlStr, self.postStr);
    
    self.urlConnection = [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    if (!self.urlConnection) {
        [self.delegate restClient:self didFailWithError:nil];
    }
    NSLog(@"NULL");
}


#pragma mark - NSUrlConnectionDelegate
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

#pragma mark- NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    self.resposeStatus = [(NSHTTPURLResponse*)response statusCode];
    self.connData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"data for : %@", self.postStr);
    [self.connData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"didfail for : %@", self.postStr);
    static BOOL retried = false;
    if (error.code == -1005 && !retried) {
        retried = true;
        NSLog(@"Retrying request!!\n%@", connection.originalRequest.URL);
        [self loadRequest];
        return;
    }
    
    if (self.delegate) {
        [self.delegate restClient:self didFailWithError:error];
    }else if (self.responseHandler){
        self.responseHandler(self.resposeStatus, self.connData, error);
    }
    NSLog(@"Failed connection. Please check, %@", error.debugDescription);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSLog(@"didfinish for : %@", self.postStr);
    
    NSLog(@"URL: %@\n Response Code: %ld\nResponse:\n%@", connection.originalRequest, (long)self.resposeStatus, [[NSString alloc] initWithData:self.connData encoding:NSUTF8StringEncoding]);

    @try {
        id jsonObject=[NSJSONSerialization
                       JSONObjectWithData:self.connData
                       options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers
                       error:nil];
        
        if (self.delegate) {
            [self.delegate restClient:self didFinishWithObject:jsonObject];
        }else if ([self responseHandler]){
            self.responseHandler(self.resposeStatus, self.connData, nil);
        }
        
    }
    @catch (NSException *exception) {
        if (self.delegate) {
            [self.delegate restClient:self didFailWithError:nil];
        }else if (self.responseHandler){
            self.responseHandler(self.resposeStatus, self.connData, nil);
        }
    }
}

@end
