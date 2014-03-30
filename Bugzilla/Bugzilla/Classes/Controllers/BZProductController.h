//
//  BZProductController.h
//  Bugzilla
//
//  Created by Apoorv Garg on 29/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Type Definitions
typedef void (^BZParseManagerCompletion)(BOOL success, NSInteger errorCode);

@interface BZProductController : NSObject

+(BZProductController *)sharedInstance;

-(void) getSelectableProductIdsWithCompletion   :(BZParseManagerCompletion)completion;
-(void) getEnterableProductIdsWithCompletion    :(BZParseManagerCompletion)completion;
-(void) getAccessibleProductIdsWithCompletion   :(BZParseManagerCompletion)completion;

-(void) getProductDetailsUsingProductIds:(NSArray *)productIds
                            ProductNames:(NSArray *)productNames
                                    Type:(NSString *)productType
                          withCompletion:(BZParseManagerCompletion)completion;

@end
