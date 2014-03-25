//
//  BZLoginController.m
//  Bugzilla
//
//  Created by Apoorv Garg on 13/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZLoginController.h"
#import "BZWebServiceClient.h"
#import "BZUser+Utils.h"
#import "BZUserInfo+Utils.h"

@implementation BZLoginController

#pragma mark - Constants

static BZWebServiceClient *client;
static BZUser *currentUser;

+ (BZLoginController *)sharedInstance
{
    static BZLoginController *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BZLoginController alloc] init];
        client = [BZWebServiceClient sharedClient];
    });
    
	return _sharedInstance;
}


-(void)getBugzillaVersion:(BZParseManagerCompletion)completion
{
    //Create request
    //BZWebServiceClient *client = [BZWebServiceClient sharedClient];
    [client invokeMethod:BZServiceVersionURI
          withParameters:nil
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

-(void)invokeLoginWithDetails:(NSArray*)userData withBlock:(BZParseManagerCompletion)completion
{
    NSDictionary* loginParams = @{@"login":@"anoop.sharma@ymail.com",
                                  @"password":@"India@123"};
    //Create request
    [client invokeMethod:BZServiceLoginURI
          withParameters:@[loginParams]
                  result:^(BZServiceResult *result){
                      
                      if (result.success)
                      {
                          //Parsing and Model
                          if ([result.result count]) {
                              if (result.result[@"token"]) {
                                  [[NSUserDefaults standardUserDefaults] setValue:result.result[@"token"] forKey:@"kBZAccesstoken"];
                              }
                          }
                          currentUser = [BZUser saveUsersCredentials :loginParams
                                inManagedObjectContext :appDelegate.managedObjectContext];
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


-(void)retrieveUserInfo:(id)userID withBlock:(BZParseManagerCompletion)completion
{
    //    NSDictionary* loginParams = @{@"login":userData[@"login"],
    //                                  @"password":userData[@"password"]};
    NSArray *ids = [NSArray arrayWithObjects:@"439387", nil];
    NSDictionary* userIds = @{@"ids":ids};
    //Create request
    [client invokeMethod:BZServiceUserInfoURI
          withParameters:@[userIds]
                  result:^(BZServiceResult *result){
                      
                      if (result.success)
                      {
                          
                          [BZUserInfo  saveUserDetails:result.result inManagedObjectContext:appDelegate.managedObjectContext forUser:currentUser];
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
