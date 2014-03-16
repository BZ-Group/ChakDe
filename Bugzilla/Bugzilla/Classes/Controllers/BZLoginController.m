//
//  BZLoginController.m
//  Bugzilla
//
//  Created by Apoorv Garg on 13/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZLoginController.h"
#import "BZWebServiceClient.h"

@implementation BZLoginController

#pragma mark - Constants
// urls
static NSString * const BZServiceVersionURI               = @"Bugzilla.version";
static NSString * const BZServiceLoginURI                 = @"User.login";
static NSString * const BZServiceUserInfoURI              = @"User.get";

static BZWebServiceClient *client;

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