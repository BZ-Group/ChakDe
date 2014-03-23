//
//  BZUserInfo+Utils.h
//  Bugzilla
//
//  Created by Anoop on 3/23/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZUserInfo.h"
#import "BZUser.h"

@interface BZUserInfo (Utils)

+(BZUserInfo *) saveUserDetails : (NSDictionary*)userData
         inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forUser:(BZUser*)currentUser;

+(BZUserInfo *) getUserDetails:(NSManagedObjectContext*) managedObjectContext forUser:(NSString*)userID;

@end
