//
//  BZWebServiceClient.h
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "BZServiceResult.h"


#pragma mark Type Definitions
typedef void (^BZRequestCompletion)(BZServiceResult *result);


@interface BZWebServiceClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

- (void)invokeMethod:(NSString *)method
      withParameters:(id)parameters
              result:(BZRequestCompletion)completion;

@end


//             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
//             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
