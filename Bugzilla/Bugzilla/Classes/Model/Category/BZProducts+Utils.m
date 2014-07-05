//
//  BZProducts+Utils.m
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZProducts+Utils.h"
#import "BZComponents.h"

@implementation BZProducts (Utils)

+(BZProducts *) saveProducts : (NSDictionary*)userData
      inManagedObjectContext : (NSManagedObjectContext*) managedObjectContext forUser:(BZUser*)currentUser{
    
    
    if(![userData count]) return nil;

    NSPredicate * predicateProduct = nil;
    BZProducts *products = nil;
    NSError *error = nil;
    
    BZComponents *components;
    NSArray *productKeys = [userData allKeys];
    NSDictionary* productDict = [[userData valueForKey:@"products"] lastObject];
    for (NSString* keyName in productKeys) {
        
        if(!BZIsEmpty(productDict[@"id"])){
            predicateProduct   = [NSPredicate predicateWithFormat:@"product_id = %@",productDict[@"id"]];
        }

        products =     (BZProducts*)[NSManagedObject getManagedObjectForEntity:@"BZProducts" withPredicate:predicateProduct];
        
        if([keyName isEqualToString:@"products"]){
            NSArray *componentArr = [productDict count]?[productDict valueForKey:@"components"] :nil;
            
            [products setIs_active:productDict[@"is_active"]];
            [products setName:productDict[@"name"]];
            [products setProd_description:productDict[@"description"]];
            [products setProduct_id:productDict[@"id"]];
            [products setHasUser:currentUser];
            NSMutableArray *componentSet = [NSMutableArray array];
            for (NSDictionary* compData in componentArr) {
                
                NSPredicate * predicateComponent = [NSPredicate predicateWithFormat:@"comp_id = %@",compData[@"id"]];
                components =     (BZComponents*)[NSManagedObject getManagedObjectForEntity:@"BZComponents" withPredicate:predicateComponent];
                [components setComp_default_assigned_to:compData[@"default_assigned_to"]];
                [components setComp_description:compData[@"description"]];
                [components setComp_id:compData[@"id"]];
                [components setComp_is_active:compData[@"is_active"]];
                [components setComp_name:compData[@"name"]];
                [components setOfProduct:products];
                [componentSet addObject:components];
                //[products addHasComponentsObject:components];

            }
            NSOrderedSet *orderedSet = [[NSOrderedSet alloc] initWithArray:componentSet];
            if([orderedSet count])
                [products setHasComponents:orderedSet];

        }
        [managedObjectContext save:&error];
    }

    return products;

}
+(NSArray *) getProducts:(NSManagedObjectContext*) managedObjectContext fforUser:(BZUser*)currentUser{
    return nil;
}

@end
