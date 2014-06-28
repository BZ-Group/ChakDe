//
//  NSManagedObject+Utils.h
//  Bugzilla
//
//  Created by Anoop on 3/17/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Utils)

+(NSManagedObject*)getManagedObjectContextForEntity:(NSString*)entityName withPredicate:(NSPredicate*)predicate;

@end
