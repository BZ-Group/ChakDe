//
//  BZBugInfo+Utils.m
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZBugInfo+Utils.h"

@implementation BZBugInfo (Utils)

+(BZBugInfo *) saveBugDetails : (NSDictionary*)userData
inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forBugId:(BZBugs*)bug{
    return nil;
}

+(NSArray *) getBugDetails:(NSManagedObjectContext*) managedObjectContext forBugId:(BZBugs*)bug{
    
    return nil;
}
@end
