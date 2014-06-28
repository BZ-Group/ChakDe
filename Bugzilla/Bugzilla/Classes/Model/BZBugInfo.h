//
//  BZBugInfo.h
//  Bugzilla
//
//  Created by Anoop on 6/28/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BZBugs;

@interface BZBugInfo : NSManagedObject

@property (nonatomic, retain) BZBugs *bugId;

@end
