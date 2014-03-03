//
//  BZServiceResult.h
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BZServiceResult : NSObject

#pragma mark -
#pragma mark Properties

@property (nonatomic, readonly) id          result;
@property (nonatomic, readonly) BOOL        success;
@property (nonatomic, readonly) NSString    *error;
@property (nonatomic, readonly) NSInteger   errorCode;
@property (nonatomic, readonly) NSInteger   statusCode;


#pragma mark -
#pragma mark Methods

+ (BZServiceResult *)resultWithError: (NSString *)error
                           errorCode: (NSInteger)errorCode
                          statusCode: (NSInteger)statusCode;

+ (BZServiceResult *)resultWithResult: (id)result
                           statusCode: (NSInteger)statusCode;

@end
