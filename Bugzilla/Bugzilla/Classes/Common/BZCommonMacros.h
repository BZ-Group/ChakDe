//
//  JBCommonMacros.h
//  Bugzilla
//
//  Created by Apoorv Garg on 25/08/13.
//  Copyright (c) 2013 iCoder. All rights reserved.
//


#pragma mark Helper

#define HEIGHT_IPHONE_5 568
#define IS_IPHONE   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds ].size.height == HEIGHT_IPHONE_5 )
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

/*
 *  breif   :   macro for string constant declaration
 *  params  :   strName     - name of the constant
 *          :   strValue    - value of the constant
 *  author  :   anoop.sharma@ymail.com
 *  dated   :   16th Mar 2014
 */
#define STR_CONST(strName, strValue) extern NSString* const strName

//To check Null object
static inline BOOL BZIsNull(id object)
{
	BOOL isNull = NO;
	
	if (object == nil
		|| object == [NSNull null])
	{
		isNull = YES;
	}
	
	return isNull;
}

//To check empty object
static inline BOOL BZIsEmpty(id object)
{
	BOOL isEmpty = NO;
	
	if (BZIsNull(object) == YES
		|| ([object respondsToSelector: @selector(length)]
			&& [object length] == 0)
		|| ([object respondsToSelector: @selector(count)]
			&& [object count] == 0))
	{
		isEmpty = YES;
	}
	
	return isEmpty;
}

