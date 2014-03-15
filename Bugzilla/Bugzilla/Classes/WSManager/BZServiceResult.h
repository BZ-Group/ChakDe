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
@property (nonatomic, readonly) NSString    *errorMessage;
@property (nonatomic, readonly) NSInteger   errorCode;


#pragma mark -
#pragma mark Methods

+ (BZServiceResult *)resultWithError: (NSError *)error;

+ (BZServiceResult *)resultWithResult: (id)result;

@end
