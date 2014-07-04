

#import "NSArray+Utilities.h"

@implementation NSArray (Utilities)

//--------------------------------------------------------------------------------------------------
//	Function Name	:	sort
//	Description		:   sort an array based on a key passed to it
//	param			:	[in] NSArray*      - array to be sorted
//                  :	[in] (NSArray*)sortKeys - keys
//	return			:	NSArray*           - sorted array
//--------------------------------------------------------------------------------------------------
+ (NSArray*)sort:(NSArray*)inArray sortKeys:(NSArray*)sortKeys
{
    if (![sortKeys count] || ![inArray count])
    {
        return inArray;
    }
    NSMutableArray*     sortArray       = [[NSMutableArray alloc] initWithArray:inArray];
    NSMutableArray *sortDescs = [NSMutableArray array];
    for (NSInteger x = 0; x < [sortKeys count]; x++) {
        NSString *key = [sortKeys bzObjectAtIndex:x];
        NSSortDescriptor*   sortDescriptor  = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
        [sortDescs addObject:sortDescriptor];
    }
    NSArray*            sortDescriptors = [NSArray arrayWithArray:sortDescs];
    //[sortArray sortUsingDescriptors:sortDescriptors];
    sortArray = (NSMutableArray *)[sortArray sortedArrayUsingDescriptors:sortDescriptors];
    return sortArray;
}

//--------------------------------------------------------------------------------------------------
//	Function Name	:	sort
//	Description		:   sort an array based on a key passed to it
//	param			:	[in] NSArray*      - array to be sorted
//                  :	[in] NSString*     - sortKey
//	return			:	NSArray*           - sorted array
//--------------------------------------------------------------------------------------------------
+ (NSArray*)sort:(NSArray*)inArray sortKey:(NSString*)sortKey
{
    if (![sortKey length] || ![inArray count])
    {
        return inArray;
    }
    NSMutableArray*     sortArray       = [[NSMutableArray alloc] initWithArray:inArray];
    NSSortDescriptor*   sortDescriptor  = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:YES];
    NSArray*            sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    //[sortArray sortUsingDescriptors:sortDescriptors];
    sortArray = (NSMutableArray *)[sortArray sortedArrayUsingDescriptors:sortDescriptors];
    return sortArray;
}

//--------------------------------------------------------------------------------------------------
//	Function Name	:	sort
//	Description		:   sort a string array based on alphabetically
//	param			:	[in] NSArray*      - array to be sorted
//	return			:	NSArray*           - sorted array
//--------------------------------------------------------------------------------------------------
+ (NSArray*)sortStringArray:(NSArray*)unsortedObjects
{
    if (![unsortedObjects count]) {
        return unsortedObjects;
    }
    return [unsortedObjects sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

//--------------------------------------------------------------------------------------------------
//	Function Name	:	ekObjectAtIndex: forArray:
//	Description		:   check array bound and return object
//	param			:   [in] NSInteger - array index value
//	return			:	id - object
//--------------------------------------------------------------------------------------------------

-(id)bzObjectAtIndex:(NSInteger)index
{
    id value;
    if([self count] > index)
        value = [self objectAtIndex:index];
    else
        value = nil;
    return value;
}


-(NSArray *)validatePredicateValue{
    NSArray *old = self;
    old = [old count] ? old : [NSArray array];
    return old;
}


@end
