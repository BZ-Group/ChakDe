//
//  BZComponents.h
//  Bugzilla
//
//  Created by Anoop on 6/28/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZProducts;

@interface BZComponents : NSManagedObject

@property (nonatomic, retain) NSString * comp_default_assigned_to;
@property (nonatomic, retain) NSString * comp_description;
@property (nonatomic, retain) NSNumber * comp_id;
@property (nonatomic, retain) NSNumber * comp_is_active;
@property (nonatomic, retain) NSString * comp_name;
@property (nonatomic, retain) BZProducts *ofProduct;

@end
