//
//  BZProducts.h
//  Bugzilla
//
//  Created by Anoop on 6/28/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZComponents, BZUser;

@interface BZProducts : NSManagedObject

@property (nonatomic, retain) NSNumber * is_active;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * prod_description;
@property (nonatomic, retain) NSNumber * product_id;
@property (nonatomic, retain) NSOrderedSet *hasComponents;
@property (nonatomic, retain) BZUser *hasUser;
@end

@interface BZProducts (CoreDataGeneratedAccessors)

- (void)insertObject:(BZComponents *)value inHasComponentsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHasComponentsAtIndex:(NSUInteger)idx;
- (void)insertHasComponents:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHasComponentsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHasComponentsAtIndex:(NSUInteger)idx withObject:(BZComponents *)value;
- (void)replaceHasComponentsAtIndexes:(NSIndexSet *)indexes withHasComponents:(NSArray *)values;
- (void)addHasComponentsObject:(BZComponents *)value;
- (void)removeHasComponentsObject:(BZComponents *)value;
- (void)addHasComponents:(NSOrderedSet *)values;
- (void)removeHasComponents:(NSOrderedSet *)values;
@end
