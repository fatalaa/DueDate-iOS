//
//  DueDateTests.m
//  DueDateTests
//
//  Created by Tibor Molnár on 2016. 11. 09..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DateHelper.h"

@interface DueDateTests : XCTestCase

@property (nonatomic, strong) id <DateHelperInterface> dateHelper;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation DueDateTests

- (void)setUp {
    [super setUp];
    _dateHelper = [DateHelper new];
    _formatter = [NSDateFormatter new];
    _formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm";
    _formatter.timeZone = [NSTimeZone timeZoneWithName:@"Europe/Budapest"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOneDayAddition {
    // The start date is a Wednesday
    NSDate *date = [self.formatter dateFromString:@"2016-11-02T10:02"];
    NSDate *newDate = [self.dateHelper calculateDueDateWithSubmitTime:date turnaroundTimeInHours:8];
    NSDate *expectedDate = [self.formatter dateFromString:@"2016-11-03T10:02"];
    XCTAssertEqual(expectedDate, newDate);
}

- (void)testFractionAddition {
    // The start date is a Wednesday
    NSDate *date = [self.formatter dateFromString:@"2016-11-02T10:02"];
    NSDate *newDate = [self.dateHelper calculateDueDateWithSubmitTime:date turnaroundTimeInHours:15];
    NSDate *expectedDate = [self.formatter dateFromString:@"2016-11-03T17:02"];
    XCTAssertEqual(expectedDate, newDate);
}

- (void)testWeekendSkip {
    // The start date is a Friday
    NSDate *date = [self.formatter dateFromString:@"2016-11-04T10:02"];
    NSDate *newDate = [self.dateHelper calculateDueDateWithSubmitTime:date turnaroundTimeInHours:8];
    NSDate *expectedDate = [self.formatter dateFromString:@"2016-11-07T10:02"];
    XCTAssertEqual(expectedDate, newDate);
}

- (void)testWeekendSkipWithFraction {
    // The start date is a Friday
    NSDate *date = [self.formatter dateFromString:@"2016-11-04T10:02"];
    NSDate *newDate = [self.dateHelper calculateDueDateWithSubmitTime:date turnaroundTimeInHours:15];
    NSDate *expectedDate = [self.formatter dateFromString:@"2016-11-07T17:02"];
    XCTAssertEqual(expectedDate, newDate);
}

@end
