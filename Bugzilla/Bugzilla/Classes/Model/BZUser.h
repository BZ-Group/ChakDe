//
//  BZUser.h
//  Bugzilla
//
//  Created by Anoop on 5/25/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZBugs, BZProducts, BZUserInfo;

@interface BZUser : NSManagedObject

@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * remember;
@property (nonatomic, retain) BZBugs *hasBug;
@property (nonatomic, retain) BZUserInfo *userInfo;
@property (nonatomic, retain) BZProducts *hasProducts;

@end
