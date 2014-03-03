//
//  BZParseManager.m
//  Bugzilla
//
//  Created by Apoorv Garg on 04/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import "BZParseManager.h"
#import "BZRequestManager.h"

@implementation BZParseManager

+ (BZParseManager *)sharedInstance
{
    static BZParseManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BZParseManager alloc] init];
    });
    
	return _sharedInstance;
}


-(void)method1:(BZParseManagerCompletion)completion
{
    BZRequestManager *bzRequestManager = [BZRequestManager sharedInstance];

    // begin method1
    [bzRequestManager method1:^(BZServiceResult *result)
    {
        if (result.success == YES)
        {
            //Parsing and Model
            
            // callback
            completion(result.success, result.error, result.errorCode);
        }
        else
        {
            // callback
            completion(result.success, result.error, result.errorCode);
        }
    }];
}

@end
