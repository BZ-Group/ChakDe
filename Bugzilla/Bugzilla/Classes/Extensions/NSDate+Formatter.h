//
//  NSDate+Formatter.h
//  Bugzilla
//
//  Created by  on 08/09/13.
//  Copyright (c) 2013 iCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatter)

+ (NSDateFormatter *)dateFormatterWithString:(NSString *)string;
+ (NSString *)currentDateStringWithFormat:(NSString *)dateFormat;
+ (NSString *)stringFromDate:(NSDate *)date andFormat:(NSString *)dateFormat;
+ (NSDate *)dateFromString:(NSString *)date andFormat:(NSString *)dateFormat;


@end
