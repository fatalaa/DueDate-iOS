//
//  DateHelper.h
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 10..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DateHelperInterface <NSObject>

- (NSDate *)calculateDueDateWithSubmitTime:(NSDate *)submitTime turnaroundTimeInHours:(NSUInteger)turnaroundTime;

@end

FOUNDATION_EXPORT NSUInteger const kEMSDateHelperBusinessDayInHours;

@interface DateHelper : NSObject <DateHelperInterface>

@end
