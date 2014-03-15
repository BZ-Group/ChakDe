//
//  BZLoginController.h
//  Bugzilla
//
//  Created by Apoorv Garg on 13/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Type Definitions
typedef void (^BZParseManagerCompletion)(BOOL success, NSInteger errorCode);

@interface BZLoginController : NSObject

+(BZLoginController *)sharedInstance;

-(void)getBugzillaVersion:(BZParseManagerCompletion)completion;

@end
