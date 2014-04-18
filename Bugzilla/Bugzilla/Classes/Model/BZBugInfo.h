//
//  BZBugInfo.h
//  Bugzilla
//
//  Created by Anoop on 4/18/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZBugs;

@interface BZBugInfo : NSManagedObject

@property (nonatomic, retain) BZBugs *bugId;

@end
