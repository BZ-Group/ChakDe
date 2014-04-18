//
//  BZProducts+Utils.h
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZProducts.h"
#import "BZUser.h"

@interface BZProducts (Utils)

+(BZProducts *) saveProducts : (NSDictionary*)userData
       inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forUser:(BZUser*)currentUser;
+(NSArray *) getProducts:(NSManagedObjectContext*) managedObjectContext fforUser:(BZUser*)currentUser;

@end
