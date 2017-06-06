//
//  PBParamObject.h
//  Plabro
//
//  Created by VISHAL DHIMAN on 16/06/15.
//  Copyright (c) 2015 Plabro. All rights reserved.
//

#import <Foundation/Foundation.h>

#define REFER @"data/Refer"
#define REFER_CONSUMED @"data/ReferConsumed"
typedef enum : NSUInteger {
    DEFAULT = 0,
    SUCCESS,
    FAILED_UNKNOWN,
    FAILED_CONNECTION_ERROR,
    FAILED_SESSION_EXPIRED,
    FAILED_NO_INTERNET,
    FAILED_STATUS_FALSE,
    FAILED_PARSE_EXCEPTION,
    FAILED_NO_DATA_EXCEPTION,
} RtStatus;

@interface HttpObject : NSObject
- (instancetype)initWithUrl:(NSString *)pageUrl withTaskCode:(NSString *)taskCode;
@property (nonatomic, readwrite) RtStatus status;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) NSMutableDictionary *headers;
@property (nonatomic, strong) NSString *methodType;
@property (nonatomic, strong) Class classType;
@property (nonatomic, strong) NSString *taskCode;
@property (nonatomic, strong) NSDictionary *postJsonDict;
//
//-(void)setPostJson:(NSMutableDictionary *)jsonDict;
-(void)setMethod:(NSString *)method;
-(void)setTaskCodeValue:(NSString *)taskCodeValue;
-(void)addParam:(NSString *)key andValue:(NSString *)value;


@end
