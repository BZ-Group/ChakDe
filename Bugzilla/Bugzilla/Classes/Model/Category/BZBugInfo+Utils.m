//
//  BZBugInfo+Utils.m
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZBugInfo+Utils.h"

@implementation BZBugInfo (Utils)

+(BZBugInfo *) saveBugDetails : (NSDictionary*)userData
inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forBugId:(BZBugs*)bug{
    
//    if(![userData count]) return nil;
//    
//    NSPredicate * predicateBugs = nil;
//    BZBugInfo *bugs = nil;
//    NSError *error = nil;
//    
//    NSMutableArray *bugsArr = [NSMutableArray array];
//    
//    NSDictionary* bugsDict = [userData valueForKey:@"bugs"];
//    for (NSDictionary* bugInfo in bugsDict) {
//        
//        if(!BZIsEmpty(bug[@"id"])){
//            predicateBugs   = [NSPredicate predicateWithFormat:@"bug_id = %@",bugInfo[@"id"]];
//        }
//        
//        bugs =     (BZBugInfo*)[NSManagedObject getManagedObjectContextForEntity:@"BZBugInfo" withPredicate:predicateBugs];
//        [bugs setPriority:bug[@"priority"]];
//        [bugs setProduct:bug[@"product"]];
//        [bugs setSummary:bug[@"summary"]];
//        [bugs setStatus:bug[@"status"]];
//        [bugs setSeverity:bug[@"severity"]];
//        [bugs setBug_id:bug[@"id"]];
//        [bugs setComponent:bug[@"component"]];
//        [bugs setCreator:bug[@"creator"]];
//        [bugs setAssigned_to:bug[@"assigned_to"]];
//        [bugs setIs_open:bug[@"is_open"]];
//        [bugs setHasUser:currentUser];
//        [bugsArr addObject:bugs];
//        
//    }
//    [managedObjectContext save:&error];
//    return bugsArr;
    return nil;
}

+(NSArray *) getBugDetails:(NSManagedObjectContext*) managedObjectContext forBugId:(BZBugs*)bug{
    
    return nil;
}
@end
