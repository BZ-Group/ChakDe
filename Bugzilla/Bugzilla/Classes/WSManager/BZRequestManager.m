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
static NSString * const JBServiceLoginURI               = @"url1";


+ (BZRequestManager *)sharedInstance
{
    static BZRequestManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BZRequestManager alloc] init];
    });
    
	return _sharedInstance;
}


-(void)method1:(BZRequestCompletion)completion
{
    //Create request
    
    //Submit request
    
            //Success
    
            //Failure
}

@end
