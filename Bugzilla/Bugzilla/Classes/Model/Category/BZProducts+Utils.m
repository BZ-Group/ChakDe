//
//  BZProducts+Utils.m
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZProducts+Utils.h"

@implementation BZProducts (Utils)

+(BZProducts *) saveProducts : (NSDictionary*)userData
      inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forUser:(BZUser*)currentUser{
    
    
    if(![userData count]) return nil;
    
   // NSString* userLoginId = [NSString stringWithFormat:@"%@", userData[@"login"]];
    
    // Get the Already existing data
    BZProducts *products = nil;
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"BZProducts"];
    if(!BZIsEmpty(products.product_id)){
        request.predicate   = [NSPredicate predicateWithFormat:@"product_id = %@",products.product_id];
    }
    
    NSError* error = nil;
    NSArray *fetchResults = [[NSArray alloc] init];
    fetchResults = [managedObjectContext executeFetchRequest:request error:&error] ;
    
    //NSLog(@"DB Error : %@",error );
    
    // Case 1:
    // If Error occurs
    if(!fetchResults || [fetchResults count] > 1){
        // handle the error
    }
    // Case 2:
    // If the user doesn't Exist
    else if(![fetchResults count]){
        products = (BZProducts *)[NSEntityDescription insertNewObjectForEntityForName:@"BZProducts"
                                                       inManagedObjectContext:managedObjectContext];
        
        for (id productsList in userData) {
            
            ;
            ;
            setComp_id;
            setComp_is_active;
            setComp_name;
            setIs_active;
            setName;
            setProd_description;
            setProduct_id;
            setHasUser;
            
            
            [products setComp_default_assigned_to:productsList[@"login"]];
            [products setComp_description:productsList[@"password"]];
            [products setRemember:productsList[@"remeber"]];
        }
        
    }
    // Case 3:
    // If the user Exists
    else {
        
        user = [fetchResults lastObject];
    }
    return user;
    
    return nil;
}
+(NSArray *) getProducts:(NSManagedObjectContext*) managedObjectContext fforUser:(BZUser*)currentUser{
    return nil;
}

@end
