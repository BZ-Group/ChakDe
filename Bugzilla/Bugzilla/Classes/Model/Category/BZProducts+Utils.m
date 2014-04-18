//
//  BZProducts+Utils.m
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZProducts+Utils.h"

@implementation BZProducts (Utils)

+(BZProducts *) saveProducts : (NSDictionary*)userData
      inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forUser:(BZUser*)currentUser{
    return nil;
}
+(NSArray *) getProducts:(NSManagedObjectContext*) managedObjectContext fforUser:(BZUser*)currentUser{
    return nil;
}

@end
