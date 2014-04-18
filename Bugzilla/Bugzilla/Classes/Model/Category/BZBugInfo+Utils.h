//
//  BZBugInfo+Utils.h
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZBugInfo.h"

@interface BZBugInfo (Utils)

+(BZBugInfo *) saveBugDetails : (NSDictionary*)userData
       inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forBugId:(BZBugs*)bug;
+(NSArray *) getBugDetails:(NSManagedObjectContext*) managedObjectContext forBugId:(BZBugs*)bug;

@end
