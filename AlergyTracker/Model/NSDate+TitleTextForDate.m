//
//  NSDate+TitleTextForDate.m
//  AllergyTracker
//
//  Created by Developer on 2016/06/25.
//  Copyright © 2016 Radical Robot. All rights reserved.
//

#import "NSDate+TitleTextForDate.h"

#import "NSDate+Utilities.h"
#import "NSDateFormatter+Utilities.h"

@implementation NSDate (TitleTextForDate)

+(NSString*)titleTextForDate:(NSDate*)date
{
    NSString *titleTextForDate;
    NSDate *today = [NSDate date];
    NSDate *tomorrow = [today rr_addNumberOfDays:1];
    NSDate *yesterday = [today rr_addNumberOfDays:-1];
    
    if([date rr_isSameDayAsDate:[NSDate date]])
    {
        titleTextForDate = @"Today";
    }
    else if([date rr_isSameDayAsDate:tomorrow])
    {
        titleTextForDate = @"Tomorrow";
    }
    else if([date rr_isSameDayAsDate:yesterday])
    {
        titleTextForDate = @"Yesterday";
    }
    else
    {
        titleTextForDate = [[NSDateFormatter rr_dateFormatter] stringFromDate:date];
    }
    
    return titleTextForDate;
}

@end
