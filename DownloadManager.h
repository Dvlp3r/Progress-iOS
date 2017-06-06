//
//  PBDownloadManager.h
//  Plabro
//
//  Created by VISHAL DHIMAN on 16/06/15.
//  Copyright (c) 2015 Plabro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpObject.h"
#import "RestClient.h"

@protocol RestDelegate;

@interface DownloadManager : NSObject

-(instancetype) initWithParamObject:(HttpObject*)obj withDelegate:(id<RestDelegate>) delegate andTaskCode:(NSString*)taskCode;
-(void)startDownload;


@property (nonatomic, copy) NSString *taskCode;
@property (nonatomic, copy) NSString *customUrl;
@property (nonatomic, weak) id<RestDelegate> delegate;
@property (nonatomic, strong) HttpObject *params;
@property (nonatomic, strong) RestClient *downloadClient;
@end

@protocol RestDelegate <NSObject>

@required
-(BOOL)onSuccess:(id)object forRT:(NSString*)rt andParamObject:(HttpObject*)params;
-(void)onFailure:(HttpObject *)paramObject forRT:(NSString*)rt;
@optional
-(void)onPreExecute:(id)object forRT:(NSString*)rt;
@end