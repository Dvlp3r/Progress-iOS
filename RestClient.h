//
//  PBRestClient.h
//  Plabro
//
//  Created by VISHAL DHIMAN on 16/06/15.
//  Copyright (c) 2015 Plabro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpObject.h"
@protocol PBRestClientDelegate;

@interface RestClient : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

-(instancetype)initWithUrlString:(NSString*)urlString postString:(NSString*)postStr methodType:(NSString*)httpMethod completionHandler:(void (^)(NSInteger responseCode, NSData* data, NSError* connectionError)) handler;
-(instancetype)initWithHttp:(HttpObject *)httpObject postString:(NSString *)postStr completionHandler:(void (^)(NSInteger responseCode, NSData* data, NSError* connectionError)) handler;
-(void)stopLoading;
-(void)loadRequest;

@property (nonatomic, copy) void (^responseHandler)(NSInteger responseCode, NSData* data, NSError* connectionError);

@property (nonatomic, weak) id<PBRestClientDelegate> delegate;

@property (nonatomic, copy) NSString *urlStr;
@property (nonatomic, copy) NSString *httpMethodType;
@property (nonatomic, copy) NSString *postStr;

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) HttpObject *httpObject;

@property (nonatomic ) NSInteger resposeStatus;
@property (nonatomic, strong) NSMutableData* connData;


@end


@protocol PBRestClientDelegate <NSObject>

-(void) restClient:(RestClient*)client didFinishWithObject:(id)object;
-(void) restClient:(RestClient*)client didFailWithError:(NSError *)error;

@end
