//
//  BZUser+Utils.m
//  Bugzilla
//
//  Created by Anoop on 3/16/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZUser+Utils.h"

@implementation BZUser (Utils)


+(BZUser *) registerUserWithData : (NSDictionary*)userData
        inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext{
    
    NSString* userLoginId = [NSString stringWithFormat:@"%@", userData[@"login"]];
    // Get the Already existing data
    BZUser *user = nil;
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"BZUser"];
    //if(!BZIsEmpty(userLoginId)){
        request.predicate   = [NSPredicate predicateWithFormat:@"login = %@",userLoginId];
    //}
    
    NSError* error = nil;
    NSArray *fetchResults = [[NSArray alloc] init];
    fetchResults = [managedObjectContext executeFetchRequest:request error:&error] ;
    
    NSLog(@"Error : %@",error );
    // Case 1:
    // If Error occurs
    if(!fetchResults || [fetchResults count] > 1){
        // handle the error
    }
    // Case 2:
    // If the user doesn't Exist
    else if(![fetchResults count]){
        user = (BZUser *)[NSEntityDescription insertNewObjectForEntityForName:@"BZUser"
                                                     inManagedObjectContext:managedObjectContext];
        
        [user setLogin:userData[@"login"]];
        [user setPassword:userData[@"password"]];
        [user setRemember:userData[@"remeber"]];

    }
    // Case 3:
    // If the user Exists
    else {
        
        user = [fetchResults lastObject];
    }
    return user;
}


// fetch user data from the Database
+(BZUser *) fetchedUserResults :(NSManagedObjectContext*) managedObjectContext{
    
    // Get the Already existing data
    BZUser *user = nil;
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"BZUser"];
//    if(!BZIsEmpty(userLoginId)){
//        request.predicate       = [NSPredicate predicateWithFormat:@"login = %@",userData.emailID];
//    }
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
