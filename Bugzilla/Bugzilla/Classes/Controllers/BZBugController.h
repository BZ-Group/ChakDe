//
//  BZBugController.h
//  Bugzilla
//
//  Created by Apoorv Garg on 29/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Type Definitions
typedef void (^BZParseManagerCompletion)(BOOL success, NSInteger errorCode);

@interface BZBugController : NSObject

+(BZBugController *)sharedInstance;

-(void)getBugForAssignedTo:(NSString *)assignedTo
                 Component:(NSString *)component
              CreationTime:(NSString *)creationTime
                   Creator:(NSString *)creator
                        Id:(NSNumber *)bugId
            LastChangeTime:(NSString *)lastChangeTime
                     Limit:(NSNumber *)limit
                  Priority:(NSString *)priority
                   Product:(NSString *)product
                  Severity:(NSString *)severity
                    Status:(NSString *)status
                   Summary:(NSArray *)summary
            withCompletion:(BZParseManagerCompletion)completion;

-(void)getBugDetailForBugIds:(NSArray *)bugIds
              withCompletion:(BZParseManagerCompletion)completion;


@end
