//
//  BZUser.h
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZBugs, BZUserInfo;

@interface BZUser : NSManagedObject

@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * remember;
@property (nonatomic, retain) BZUserInfo *userInfo;
@property (nonatomic, retain) BZBugs *hasBug;

@end
