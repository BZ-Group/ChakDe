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

+ (BZLoginController *)sharedInstance
{
    static BZLoginController *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BZLoginController alloc] init];
    });
    
	return _sharedInstance;
}


-(void)getBugzillaVersion:(BZParseManagerCompletion)completion
{
    //Create request
    BZWebServiceClient *client = [BZWebServiceClient sharedClient];
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

@end
