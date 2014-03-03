//
//  BZParseManager.h
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Type Definitions
typedef void (^BZParseManagerCompletion)(BOOL success, NSString *errorMessage, NSInteger errorCode);

@interface BZParseManager : NSObject

+(BZParseManager *)sharedInstance;

-(void)method1:(BZParseManagerCompletion)completion;

@end
