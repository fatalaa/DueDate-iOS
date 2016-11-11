//
//  NSDate+Extensions.m
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 10..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import "NSDate+Extensions.h"

static NSInteger const kSunday = 1;
static NSInteger const kSaturday = 7;
static NSUInteger const kEMSDateHelperBusinessDayInHours = 8;

@implementation NSDate (Extensions)

- (NSDate *)addBusinessHours:(NSUInteger)hoursToAdd {
    NSUInteger businessDays = hoursToAdd / kEMSDateHelperBusinessDayInHours;
    NSUInteger remainingHours = hoursToAdd % kEMSDateHelperBusinessDayInHours;
    NSDate *newDate;
    if (businessDays > 0) {
        newDate = [self addBusinessDays:businessDays];
    }
    if (remainingHours > 0) {
        newDate = [newDate addHours:remainingHours];
    }
    newDate = [newDate ensureTimeIsBusinessHours];
    
    return newDate;
}

- (BOOL)isBusinessDay {
    NSInteger day = [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
    BOOL isWeekDay = (day != kSunday && day != kSaturday);
    return  isWeekDay;
}

- (BOOL)isBusinessTime {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self];
    NSInteger hour = components.hour;
    BOOL isBusinessTime = (hour >= 10 && hour < 18);
    return isBusinessTime;
}

- (NSDate *)addDays:(NSUInteger)daysToAdd {
    NSDateComponents *components = [NSDateComponents new];
    components.day = daysToAdd;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:NSCalendarWrapComponents];
    return newDate;
}

- (NSDate *)addHours:(NSUInteger)hoursToAdd {
    NSDateComponents *components = [NSDateComponents new];
    components.hour = hoursToAdd;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:NSCalendarWrapComponents];
    return newDate;
}

- (NSDate *)ensureDateIsBusinessDay {
    NSDate *newDate = self;
    while (![newDate isBusinessDay]) {
        newDate = [newDate addDays:1];
    }
    return newDate;
}

- (NSDate *)addBusinessDays:(NSInteger)daysToAdd {
    NSDate *newDate = self;
    for (NSInteger i = 0; i < daysToAdd; i++) {
        newDate = [newDate ensureDateIsBusinessDay];
        newDate = [newDate addDays:1];
    }
    newDate = [newDate ensureDateIsBusinessDay];
    return newDate;
}

- (NSDate *)ensureTimeIsBusinessHours {
    NSDate *newDate = self;
    while (![newDate isBusinessTime]) {
        newDate = [newDate addHours:1];
    }
    return newDate;
}

@end
