//
//  BZUserInfo+Utils.m
//  Bugzilla
//
//  Created by Anoop on 3/23/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZUserInfo+Utils.h"

@implementation BZUserInfo (Utils)


+(BZUserInfo *) saveUserDetails : (NSDictionary*)userData
         inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forUser:(BZUser *)currentUser{
    
    if(![userData count]) return nil;
    
    NSArray* userDetailsArr = [userData valueForKey:@"users"];
    NSDictionary *userDetailsDict = [userDetailsArr count]?[userDetailsArr lastObject]:nil;
    
    if(!userDetailsDict) return nil;
    
    NSString* userLoginId = [NSString stringWithFormat:@"%@", userDetailsDict[@"email"]];
    
    // Get the Already existing data
    BZUserInfo *userInfo = nil;
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"BZUserInfo"];
    if(!BZIsEmpty(userLoginId)){
        request.predicate   = [NSPredicate predicateWithFormat:@"email = %@",userLoginId];
    }
    
    
    
    NSError* error = nil;
    NSArray *fetchResults = [[NSArray alloc] init];
    fetchResults = [managedObjectContext executeFetchRequest:request error:&error] ;
    
    NSLog(@"DB Error : %@",error );
    
    // Case 1:
    // If Error occurs
    if(!fetchResults || [fetchResults count] > 1){
        // handle the error
    }
    // Case 2:
    // If the user doesn't Exist
    else if(![fetchResults count]){
        userInfo = (BZUserInfo *)[NSEntityDescription insertNewObjectForEntityForName:@"BZUserInfo"
                                                               inManagedObjectContext:managedObjectContext];
        
        [userInfo setCan_login:userData[@"can_login"]];
        [userInfo setEmail:userData[@"email"]];
        [userInfo setDesc:userData[@"desc"]];
        [userInfo setIds:userData[@"ids"]];
        [userInfo setIs_new:userData[@"is_new"]];
        [userInfo setLast_activity:userData[@"last_activity"]];
        [userInfo setName:userData[@"name"]];
        [userInfo setSaved_searches:userData[@"saved_searches"]];
        [userInfo setHasUser:currentUser];
    }
    // Case 3:
    // If the user Exists
    else {
        
        userInfo = [fetchResults lastObject];
    }
    return userInfo;
}

+(BZUserInfo *) getUserDetails:(NSManagedObjectContext*) managedObjectContext forUser:(NSString*)userID{
    // Get the Already existing data
    BZUserInfo *user = nil;
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"BZUserInfo"];
    if(!BZIsEmpty(userID)){
        request.predicate   = [NSPredicate predicateWithFormat:@"email = %@",userID];
    }
    //request.predicate       = [NSPredicate predicateWithFormat:@"unique = %@",userData.emailID];
    
    NSError* error = nil;
    NSArray *fetchResults = [[NSArray alloc] init ];
    fetchResults = [managedObjectContext executeFetchRequest:request error:&error] ;
    
    // Case 1:
    // If Error occurs
    if(!fetchResults || [fetchResults count] > 1){
        // handle the error
        
    }
    // Case 2:
    // If the User doesn't Exist
    else if(![fetchResults count]){
        
    }
    // Case 3:
    // If the Userz Exists
    else {
        
        user = [fetchResults lastObject];
    }
    NSLog(@"user : %@", user);
    return user;
}

@end
