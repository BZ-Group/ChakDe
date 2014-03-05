//
//  BZRequestManager.h
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BZServiceResult.h"


#pragma mark Type Definitions
typedef void (^BZRequestCompletion)(BZServiceResult *result);


@interface BZRequestManager : NSObject


+(BZRequestManager *) sharedInstance;


-(void)getBugzillaVersion:(BZRequestCompletion)completion;


@end
