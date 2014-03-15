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
         errorMessage: (NSString *)error
            errorCode: (NSInteger)errorCode;

@end

@implementation BZServiceResult

@synthesize result = _result;
@synthesize success = _success;
@synthesize errorMessage = _errorMessage;
@synthesize errorCode = _errorCode;


#pragma mark -
#pragma mark Constructors

+ (BZServiceResult *)resultWithError: (NSError *)error
{
	return [[BZServiceResult alloc] initWithSuccess: NO
                                             result: nil
                                       errorMessage: [error localizedDescription]
                                          errorCode: [error code]];
}


+ (BZServiceResult *)resultWithResult: (id)result
{
	return [[BZServiceResult alloc] initWithSuccess: YES
                                             result: result
                                       errorMessage: nil
                                          errorCode: 0];
}

- (id)initWithSuccess: (BOOL)success
               result: (id)result
         errorMessage: (NSString *)errorMessage
            errorCode: (NSInteger)errorCode
{
    // abort if base constructor fails
	if ((self = [super init]) == nil)
	{
		return nil;
	}
    
    if (!success) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"%d",errorCode]
                                                       message:errorMessage
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles: nil];
        [alert show];
    }

	_success = success;
	_errorCode = errorCode;
	_result = result;
	_errorMessage = errorMessage;
    
    // return initialized instance
	return self;
}

@end
