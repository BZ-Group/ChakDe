//
//  NSManagedObject+Utils.m
//  Bugzilla
//
//  Created by Anoop on 3/17/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "NSManagedObject+Utils.h"

@implementation NSManagedObject (Utils)

//--------------------------------------------------------------------------------------------------
//	Function Name	:   getManagedObjectContextForEntity
//	Description		:   update a existing row or creat a new row
//  params          :   [in]  (NSString*)entityName of the data model that we need to delete
//	return			:	void
//-------------------------------------------------------------------------------------------------
+(NSManagedObject*)getManagedObjectContextForEntity:(NSString*)entityName withPredicate:(NSPredicate*)predicate{
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entityName inManagedObjectContext:appDelegate.managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    if (predicate) {
        [fetchRequest setPredicate:predicate];
    }
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setReturnsObjectsAsFaults:NO];
    [fetchRequest setReturnsDistinctResults:YES];
    [fetchRequest setIncludesPendingChanges:YES];
    [fetchRequest setFetchBatchSize:20];
    
    NSError *error = nil;
    NSArray *fetchResults = [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(error) {
        //abort();
        //For TS issue 2049
        //[error logError];
    }
    
    if ([fetchResults count]) {
        return [fetchResults lastObject];
    }
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:appDelegate.managedObjectContext];
}




@end
