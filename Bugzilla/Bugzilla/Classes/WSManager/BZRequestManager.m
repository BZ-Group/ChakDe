//
//  BZRequestManager.m
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZRequestManager.h"
#import "BZWebServiceClient.h"

@implementation BZRequestManager

#pragma mark - Constants
// urls
static NSString * const BZServiceVersionURI               = @"Bugzilla.version";


+ (BZRequestManager *)sharedInstance
{
    static BZRequestManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BZRequestManager alloc] init];
    });
    
	return _sharedInstance;
}


-(void)getBugzillaVersion:(BZRequestCompletion)completion
{
    //Create request
    BZWebServiceClient *client = [BZWebServiceClient sharedClient];
    [client invokeMethod:BZServiceVersionURI
          withParameters:nil
                 success:^(AFHTTPRequestOperation *operation, id responseObject){
                     NSLog(@"Success");
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"Fail");
                 }
     ];
    

}

@end
