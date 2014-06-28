//
//  BZBugs+Utils.h
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZBugs.h"

@interface BZBugs (Utils)

+(NSArray *) saveBugs : (NSDictionary*)userData
         inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forUser:(BZUser*)currentUser;

+(NSArray *) getBugs:(NSManagedObjectContext*) managedObjectContext forUser:(NSString*)userID;

@end
