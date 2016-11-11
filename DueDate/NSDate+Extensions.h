//
//  NSDate+Extensions.h
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 10..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extensions)

- (BOOL)isBusinessDay;
- (BOOL)isBusinessTime;
- (NSDate *)addBusinessHours:(NSUInteger)hoursToAdd;

@end
