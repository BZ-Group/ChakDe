//
//  BZWebServiceClient.m
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZWebServiceClient.h"


@interface BZWebServiceClient ()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                parameters:(id)parameters
                                 requestId:(id)requestId;

@end


@implementation BZWebServiceClient

+ (instancetype)sharedClient {
    static BZWebServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BZWebServiceClient alloc] init];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [_sharedClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"application/jsonrequest", nil];

    });
    
    return _sharedClient;
}


- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                parameters:(id)parameters
                                 requestId:(id)requestId
{
    NSParameterAssert(method);
    
    if (!parameters) {
        parameters = @[];
    }
    
    NSAssert([parameters isKindOfClass:[NSDictionary class]] || [parameters isKindOfClass:[NSArray class]], @"Expect NSArray or NSDictionary in JSONRPC parameters");
    
    if (!requestId) {
        requestId = @(1);
    }
    
    NSMutableDictionary *payload = [NSMutableDictionary dictionary];
    payload[@"jsonrpc"] = @"2.0";
    payload[@"method"] = method;
    payload[@"params"] = parameters;
    payload[@"id"] = [requestId description];
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"kBZAccesstoken"]){
       payload[@"token"] = [[NSUserDefaults standardUserDefaults] valueForKey:@"kBZAccesstoken"];
    }
    
    
    return [self.requestSerializer requestWithMethod:@"POST" URLString:BugzillaServerBaseURLString parameters:payload error:nil];

}


- (AFHTTPRequestOperation *)HTTPRequestOperationWithRequest:(NSURLRequest *)urlRequest
                                                     result:(void (^)(BZServiceResult *result))completion
{
    return [super HTTPRequestOperationWithRequest:urlRequest
    success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSInteger code = 0;
        NSString *message = nil;
        
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            id result = responseObject[@"result"];
            id error = responseObject[@"error"];
            
            if (result && result != [NSNull null])
            {
                if (completion)
                {
                    completion([BZServiceResult resultWithResult:result]);
                }
            }
            else if (error && error != [NSNull null])
            {
                if ([error isKindOfClass:[NSDictionary class]] && error[@"code"] && error[@"message"])
                {
                    code = [error[@"code"] integerValue];
                    message = error[@"message"];
                }
                else
                {
                    message = NSLocalizedStringFromTable(@"Unknown Error", @"AFJSONRPCClient", nil);
                }
            }
            else
            {
                message = NSLocalizedStringFromTable(@"Unknown JSON-RPC Response", @"AFJSONRPCClient", nil);
            }
        }
        else
        {
            message = NSLocalizedStringFromTable(@"Unknown JSON-RPC Response", @"AFJSONRPCClient", nil);
        }
        
        if (message && completion)
        {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: message};
            NSError *error = [NSError errorWithDomain:AFJSONRPCErrorDomain code:code userInfo:userInfo];
            
            completion([BZServiceResult resultWithError:error]);
        }
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion)
        {
            completion([BZServiceResult resultWithError:error]);
        }
    }];
}


- (void)invokeMethod:(NSString *)method
      withParameters:(id)parameters
              result:(BZRequestCompletion)completion;
{
    NSMutableURLRequest *request = [self requestWithMethod:method parameters:parameters requestId:@(1)];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request result:completion];
    [self.operationQueue addOperation:operation];

}

@end
