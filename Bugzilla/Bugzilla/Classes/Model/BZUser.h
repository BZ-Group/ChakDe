//
//  BZUser.h
//  Bugzilla
//
//  Created by Anoop on 6/28/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZBugs, BZProducts, BZUserInfo;

@interface BZUser : NSManagedObject

@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * remember;
@property (nonatomic, retain) NSOrderedSet *hasBug;
@property (nonatomic, retain) NSSet *hasProducts;
@property (nonatomic, retain) BZUserInfo *userInfo;
@end

@interface BZUser (CoreDataGeneratedAccessors)

- (void)insertObject:(BZBugs *)value inHasBugAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHasBugAtIndex:(NSUInteger)idx;
- (void)insertHasBug:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHasBugAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHasBugAtIndex:(NSUInteger)idx withObject:(BZBugs *)value;
- (void)replaceHasBugAtIndexes:(NSIndexSet *)indexes withHasBug:(NSArray *)values;
- (void)addHasBugObject:(BZBugs *)value;
- (void)removeHasBugObject:(BZBugs *)value;
- (void)addHasBug:(NSOrderedSet *)values;
- (void)removeHasBug:(NSOrderedSet *)values;
- (void)addHasProductsObject:(BZProducts *)value;
- (void)removeHasProductsObject:(BZProducts *)value;
- (void)addHasProducts:(NSSet *)values;
- (void)removeHasProducts:(NSSet *)values;

@end
