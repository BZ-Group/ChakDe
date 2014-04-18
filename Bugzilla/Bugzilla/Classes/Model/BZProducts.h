//
//  BZProducts.h
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BZProducts : NSManagedObject

@property (nonatomic, retain) NSNumber * product_id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * prod_description;
@property (nonatomic, retain) NSNumber * is_active;
@property (nonatomic, retain) NSNumber * comp_id;
@property (nonatomic, retain) NSString * comp_name;
@property (nonatomic, retain) NSString * comp_description;
@property (nonatomic, retain) NSString * comp_default_assigned_to;
@property (nonatomic, retain) NSNumber * comp_is_active;

@end
