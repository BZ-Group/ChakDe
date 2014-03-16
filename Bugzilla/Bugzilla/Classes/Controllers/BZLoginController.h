//
//  BZLoginController.h
//  Bugzilla
//
//  Created by Apoorv Garg on 13/03/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BZUser.h"

#pragma mark Type Definitions
typedef void (^BZParseManagerCompletion)(BOOL success, NSInteger errorCode);

@interface BZLoginController : NSObject

+(BZLoginController *)sharedInstance;

/*
 *	breif   :	Get Bugzilla current version
 *	param	:	[in] - (^BZParseManagerCompletion):(BZParseManagerCompletion)completion
 *	return	:	IBAction
 *  author  :   anoop.sharma@ymail.com
 *  dated   :   15th Mar 2014.
 */
-(void)getBugzillaVersion:(BZParseManagerCompletion)completion;

/*
 *	breif   :	Get Bugzilla current version
 *	param	:	[in] - (^BZParseManagerCompletion):(BZParseManagerCompletion)completion
 *	return	:	IBAction
 *  author  :   anoop.sharma@ymail.com
 *  dated   :   15th Mar 2014.
 */
-(void)invokeLoginWithDetails:(NSArray*)userData withBlock:(BZParseManagerCompletion)completion;

/*
 *	breif   :	Get Bugzilla current version
 *	param	:	[in] - (^BZParseManagerCompletion):(BZParseManagerCompletion)completion
 *	return	:	IBAction
 *  author  :   anoop.sharma@ymail.com
 *  dated   :   15th Mar 2014.
 */
-(void)retrieveUserInfo:(id)userID withBlock:(BZParseManagerCompletion)completion;
@end
