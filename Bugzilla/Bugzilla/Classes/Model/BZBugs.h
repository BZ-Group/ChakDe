//
//  BZBugs.h
//  Pods
//
//  Created by Anoop on 4/18/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZBugInfo;

@interface BZBugs : NSManagedObject

@property (nonatomic, retain) NSString * assigned_to;
@property (nonatomic, retain) NSString * component;
@property (nonatomic, retain) NSString * creator;
@property (nonatomic, retain) NSNumber * bug_id;
@property (nonatomic, retain) NSNumber * is_open;
@property (nonatomic, retain) NSString * priority;
@property (nonatomic, retain) NSString * product;
@property (nonatomic, retain) NSString * severity;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) BZBugInfo *bugDetails;

@end
