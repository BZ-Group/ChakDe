

#import <Foundation/Foundation.h>

@interface NSArray (Utilities)

/*
 *	brief	:	check array bound and return object
 *	param	:	[in] NSInteger - array index value
 *  return  :   id - object
 *  author  :   anoop.sharma@emirates.com
 */
+ (NSArray*)sort:(NSArray*)inArray sortKeys:(NSArray*)sortKeys;
/*
 *	brief	:	check array bound and return object
 *	param	:	[in] NSInteger - array index value
 *  return  :   id - object
 *  author  :   anoop.sharma@emirates.com
 */
+ (NSArray*)sort:(NSArray*)inArray sortKey:(NSString*)sortKey;

/*
 *	brief	:	check array bound and return object
 *	param	:	[in] NSInteger - array index value
 *  return  :   id - object
 *  author  :   anoop.sharma@emirates.com
 */
+ (NSArray*)sortStringArray:(NSArray*)unsortedObjects;

/*
 *	brief	:	check array bound and return object
 *	param	:	[in] NSInteger - array index value
 *  return  :   id - object
 *  author  :   anoop.sharma@emirates.com
 */
-(id) bzObjectAtIndex:(NSInteger)index;

-(NSArray *)validatePredicateValue;

@end
