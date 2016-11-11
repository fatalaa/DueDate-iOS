//
//  Presenter.m
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 11..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import "Presenter.h"
#import "NSDate+Extensions.h"
#import "ViewController.h"

@implementation Presenter

- (instancetype)initWithView:(id<View>)view dateHelper:(id<DateHelperInterface>)dateHelper {
    self = [super init];
    if (self) {
        _view = view;
        _dateHelper = dateHelper;
    }
    return self;
}

- (void)addDueDateButtonTapped {
    NSDate *date = [NSDate date];
    if ([date isBusinessDay] && [date isBusinessTime]) {
        [self.view showInputField];
    } else {
        [self.view showErrorMessage:@"You can only add due dates on weekdays between 9AM and 5PM"];
    }
}

- (void)calculationInputReceivedWithRawInput:(NSString *)rawInput {
    NSDate *dueDate = [self.dateHelper calculateDueDateWithSubmitTime:[NSDate date]
                                                turnaroundTimeInHours:rawInput.integerValue];
    [self.view showResult:[dueDate description]];
}

@end
