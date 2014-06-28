//
//  BZBugController.m
//  Bugzilla
//
//  Created by Apoorv Garg on 29/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZBugController.h"
#import "BZWebServiceClient.h"
#import "BZbugs+Utils.h"

@implementation BZBugController

#pragma mark - Constants
static BZWebServiceClient *client;

+ (BZBugController *)sharedInstance
{
    static BZBugController *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BZBugController alloc] init];
        client = [BZWebServiceClient sharedClient];
    });
    
	return _sharedInstance;
}


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
            withCompletion:(BZParseManagerCompletion)completion
{
    NSArray *includeFields = @[@"assigned_to",
                               @"component",
                               @"creator",
                               @"id",
                               @"is_open",
                               @"last_change_time",
                               @"priority",
                               @"product",
                               @"severity",
                               @"status",
                               @"summary"
                               ];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:includeFields forKey:@"include_fields"];
    
    if (!BZIsEmpty(assignedTo))
    {
        [params setValue:assignedTo forKey:@"assigned_to"];
    }
    if (!BZIsEmpty(component))
    {
        [params setValue:component forKey:@"component"];
    }
    if (!BZIsEmpty(creationTime))
    {
        [params setValue:creationTime forKey:@"creation_time"];
    }
    if (!BZIsEmpty(creator))
    {
        [params setValue:creator forKey:@"creator"];
    }
    if (!BZIsEmpty(bugId))
    {
        [params setValue:bugId forKey:@"id"];
    }
    if (!BZIsEmpty(lastChangeTime))
    {
        [params setValue:lastChangeTime forKey:@"last_change_time"];
    }
    if (!BZIsEmpty(limit))
    {
        [params setValue:limit forKey:@"limit"];
    }
    if (!BZIsEmpty(priority))
    {
        [params setValue:priority forKey:@"priority"];
    }
    if (!BZIsEmpty(product))
    {
        [params setValue:product forKey:@"product"];
    }
    if (!BZIsEmpty(severity))
    {
        [params setValue:severity forKey:@"severity"];
    }
    if (!BZIsEmpty(status))
    {
        [params setValue:status forKey:@"status"];
    }
    if (!BZIsEmpty(summary))
    {
        [params setValue:summary forKey:@"summary"];
    }
    
    [client invokeMethod:BZServiceBugSearch
          withParameters:@[params]
                  result:^(BZServiceResult *result){
                      
                      if (result.success)
                      {
                          [BZBugs saveBugs:result.result inManagedObjectContext:appDelegate.managedObjectContext forUser:appDelegate.currentUser];
                          // callback
                          completion(result.success, result.errorCode);
                          
                      }
                      else
                      {
                          // callback
                          completion(result.success, result.errorCode);
                      }
                  }
     ];
}


-(void)getBugDetailForBugIds:(NSArray *)bugIds
              withCompletion:(BZParseManagerCompletion)completion
{
    [client invokeMethod:BZServiceBugDetails
          withParameters:@[@{@"ids":bugIds}]
                  result:^(BZServiceResult *result){
                      
                      if (result.success)
                      {
                          //Parsing and Model
                          
                          // callback
                          completion(result.success, result.errorCode);
                          
                      }
                      else
                      {
                          // callback
                          completion(result.success, result.errorCode);
                      }
                  }
     ];
}

@end
