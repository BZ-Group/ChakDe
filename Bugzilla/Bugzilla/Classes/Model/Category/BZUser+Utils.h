//
//  BZUser+Utils.h
//  Bugzilla
//
//  Created by Anoop on 3/16/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZUser.h"

@interface BZUser (Utils)

+(BZUser *) registerUserWithData : (NSDictionary*)userData
          inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext;

@end
