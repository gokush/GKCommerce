//
//  GKUserEntity.h
//  Pods
//
//  Created by 小悟空 on 3/15/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GKUserEntity : NSManagedObject

@property (nonatomic, retain) NSString * accessToken;
@property (nonatomic, retain) NSNumber * accessTokenExpires;
@property (nonatomic, retain) NSNumber * accessTokenType;
@property (nonatomic, retain) NSString * avatar;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * userID;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSDate * lastAuthencateDate;

@end
