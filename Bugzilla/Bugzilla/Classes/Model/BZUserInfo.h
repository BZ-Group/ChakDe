//
//  BZUserInfo.h
//  Bugzilla
//
//  Created by Anoop on 3/17/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZUser;

@interface BZUserInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * can_login;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * ids;
@property (nonatomic, retain) NSNumber * is_new;
@property (nonatomic, retain) NSString * last_activity;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * real_name;
@property (nonatomic, retain) id saved_searches;
@property (nonatomic, retain) BZUser *hasUser;

@end
