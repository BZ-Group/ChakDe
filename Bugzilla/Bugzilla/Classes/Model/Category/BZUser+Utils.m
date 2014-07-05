//
//  BZUser+Utils.m
//  Bugzilla
//
//  Created by Anoop on 3/16/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZUser+Utils.h"


@implementation BZUser (Utils)


+(BZUser *) saveUsersCredentials : (NSDictionary*)userData
        inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext{
    
    if(![userData count]) return nil;
    NSString* userLoginId = [NSString stringWithFormat:@"%@", userData[@"login"]];
    
    
    NSPredicate* predicate   = [NSPredicate predicateWithFormat:@"login = %@",userLoginId];
    BZUser *user = (BZUser*)[NSManagedObject getManagedObjectForEntity:@"BZUser" withPredicate:predicate];
    
        NSError* error = nil;
        [user setLogin:userData[@"login"]];
        [user setPassword:userData[@"password"]];
        [user setRemember:userData[@"remeber"]];
        [managedObjectContext save:&error];

    return user;
}

// fetch user data from the Database
+(BZUser *) getCredentials:(NSManagedObjectContext*) managedObjectContext forUser:(NSString*)userID{
    
    // Get the Already existing data
    BZUser *user = nil;
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"BZUser"];
    if(!BZIsEmpty(userID)){
        request.predicate       = [NSPredicate predicateWithFormat:@"login = %@",userID];
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
