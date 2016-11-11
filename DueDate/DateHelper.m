//
//  DateHelper.m
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 10..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import "NSDate+Extensions.h"
#import "DateHelper.h"

NSUInteger const kEMSDateHelperBusinessDayInHours = 8;

@implementation DateHelper

- (NSDate *)calculateDueDateWithSubmitTime:(NSDate *)submitTime turnaroundTimeInHours:(NSUInteger)turnaroundTime {
    NSDate *dueDate = [submitTime addBusinessHours:turnaroundTime];
    return dueDate;
}

@end
