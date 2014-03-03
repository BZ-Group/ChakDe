//
//  BZWebServiceClient.m
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZWebServiceClient.h"

static NSString * const BugzillaServerBaseURLString = @"https://BugzillaServer";

@implementation BZWebServiceClient

+ (instancetype)sharedClient {
    static BZWebServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BZWebServiceClient alloc] initWithBaseURL:[NSURL URLWithString:BugzillaServerBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    });
    
    return _sharedClient;
}

@end
