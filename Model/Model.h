//
//  Model.h
//  AlertApp
//
//  Created by rv-apple on 23/11/16.
//  Copyright © 2016 Rvtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic,strong) NSString *rideExperience;
@property (nonatomic,strong) NSString *rideCategory;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *arrayFirstName;
@property (nonatomic,strong) NSArray *arrayLastName;
@property (nonatomic,strong) NSString *rideType;

@property (nonatomic,strong) NSString *accessToken;




//@property (nonatomic,strong) NSMutableArray *arrayNotification;
//@property (nonatomic,strong) NSMutableArray *idArray;
//@property (nonatomic,strong) NSMutableArray *readunreadArray;
//@property (nonatomic,strong) NSMutableArray *imageArray;

+(Model*)sharedInstance;


@end
