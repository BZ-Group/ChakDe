//
//  BZWebServiceClient.h
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface BZWebServiceClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
