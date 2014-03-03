//
//  NSDate+Formatter.m
//  Bugzilla
//
//  Created by  on 08/09/13.
//  Copyright (c) 2013 iCoder. All rights reserved.
//

#import "NSDate+Formatter.h"


@implementation NSDate (Formatter)

+ (NSDateFormatter *)dateFormatterWithString:(NSString *)string
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:string];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:locale];
    
    return dateFormatter;
}

+ (NSString *)currentDateStringWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [self dateFormatterWithString:dateFormat];
    
    NSDate *now = [[NSDate alloc] init];
    NSString *dateString = [dateFormatter stringFromDate:now];

    return dateString;
}

+ (NSString *)stringFromDate:(NSDate *)date andFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [self dateFormatterWithString:dateFormat];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}


@end
