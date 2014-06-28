//
//  BZBugs+Utils.m
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZBugs+Utils.h"

@implementation BZBugs (Utils)

+(BZBugs *) saveBugs : (NSDictionary*)userData
inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forUser:(BZUser*)currentUser{
   
    return nil;
}

+(NSArray *) getBugs:(NSManagedObjectContext*) managedObjectContext forUser:(NSString*)userID{
    
    return nil;
}
@end
