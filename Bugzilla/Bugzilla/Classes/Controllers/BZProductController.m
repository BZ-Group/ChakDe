//
//  BZProductController.m
//  Bugzilla
//
//  Created by Apoorv Garg on 29/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZProductController.h"
#import "BZWebServiceClient.h"


@implementation BZProductController


#pragma mark - Constants
static BZWebServiceClient *client;


+ (BZProductController *)sharedInstance
{
    static BZProductController *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BZProductController alloc] init];
        client = [BZWebServiceClient sharedClient];
    });
    
	return _sharedInstance;
}


-(void) getAccessibleProductIdsWithCompletion:(BZParseManagerCompletion)completion
{
    //Create request
    [client invokeMethod:BZServiceAccessibleProductIdsURI
          withParameters:nil
                  result:^(BZServiceResult *result){
                      
                      if (result.success)
                      {
                          //Parsing and Model
                          //Parse the product ids
                          
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

-(void) getProductDetailsUsingProductIds:(NSArray *)productIds
                            ProductNames:(NSArray *)productNames
                                    Type:(NSString *)productType
                          withCompletion:(BZParseManagerCompletion)completion
{
 ////////////Fields of Interest////////////
    /*
     id
     name
     description
     is_active
     components
        id
        name
        description
        default_assigned_to
        is_active
    */
    
    NSArray *includeFields = @[@"id",
                               @"name",
                               @"description",
                               @"is_active",
                               @"components.id",
                               @"components.name",
                               @"components.description",
                               @"components.default_assigned_to",
                               @"components.is_active"
                               ];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:includeFields forKey:@"include_fields"];

    if (!BZIsEmpty(productIds))
    {
        [params setValue:productIds forKey:@"ids"];
    }
    if (!BZIsEmpty(productNames))
    {
        [params setValue:productNames forKey:@"names"];
    }
    if (!BZIsEmpty(productType))
    {
        [params setValue:productType forKey:@"type"];
    }
    
    [client invokeMethod:BZServiceProductDetailsURI
          withParameters:@[params]
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
