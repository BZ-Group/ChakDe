//
//  BZServiceResult.m
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZServiceResult.h"

@interface BZServiceResult (InternalInterface)

- (id)initWithSuccess: (BOOL)success
               result: (id)result
                error: (NSString *)error
            errorCode: (NSInteger)errorCode
           statusCode: (NSInteger)statusCode;

@end

@implementation BZServiceResult

@synthesize result = _result;
@synthesize success = _success;
@synthesize error = _error;
@synthesize errorCode = _errorCode;
@synthesize statusCode = _statusCode;


#pragma mark -
#pragma mark Constructors

+ (BZServiceResult *)resultWithError: (NSString *)error
                           errorCode: (NSInteger)errorCode
                          statusCode: (NSInteger)statusCode
{
	return [[BZServiceResult alloc] initWithSuccess: NO
                                             result: nil
                                              error: error
                                          errorCode: errorCode
                                         statusCode: statusCode];
}


+ (BZServiceResult *)resultWithResult: (id)result
                           statusCode: (NSInteger)statusCode
{
	return [[BZServiceResult alloc] initWithSuccess: YES
                                             result: result
                                              error: nil
                                          errorCode: 0
                                         statusCode: statusCode];
}

- (id)initWithSuccess: (BOOL)success
               result: (id)result
                error: (NSString *)error
            errorCode: (NSInteger)errorCode
           statusCode: (NSInteger)statusCode
{
    // abort if base constructor fails
	if ((self = [super init]) == nil)
	{
		return nil;
	}
    
	_success = success;
	_errorCode = errorCode;
	_statusCode = statusCode;
	_result = result;
	_error = error;
    
    // return initialized instance
	return self;
}

@end
