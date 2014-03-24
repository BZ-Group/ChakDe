//
//  BZDBManager.m
//  Bugzilla
//
//  Created by Anoop on 3/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZDBManager.h"

static NSMutableDictionary *contextArray;

@implementation BZDBManager

//-------------------------------------------------------------------------------------------------
//	Function Name	:	getContext
//	Description		:	get the NSManagedObjectContext reference based on the current thread
//	param			:	none
//	return			:	[out] - (NSManagedObjectContext*)
//-------------------------------------------------------------------------------------------------
+ (NSManagedObjectContext*)getContext
{
    NSManagedObjectContext          *managedObjectContext = nil;
    
    if([NSThread isMainThread]) {
        managedObjectContext = appDelegate.managedObjectContext;
    }
//    else {
//        managedObjectContext = (NSManagedObjectContext*)[contextArray valueForKey:[NSThread currentThread].name];
//    }
    
    // some times context is returning nill , to identify that following code is added
//    if(managedObjectContext == nil){
//        for(NSString *key in contextArray) {
//            NSLog(@"context list : %@", key);
//        }
//    }
    
    return managedObjectContext;
}

//-------------------------------------------------------------------------------------------------
//	Function Name	:	removeContext
//	Description		:	remove NSManagedObjectContext reference for the current NSOperation queue
//                  :   at the end of queue. so that the dictionary holder never grow and creat memory leak
//	param			:	none
//	return			:	none
//-------------------------------------------------------------------------------------------------
+ (void)removeContext
{
    [contextArray removeObjectForKey:[NSThread currentThread].name];
}
@end
