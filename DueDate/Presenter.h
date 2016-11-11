//
//  Presenter.h
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 11..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DateHelper.h"
#import "ViewController.h"

@protocol PresenterInterface <NSObject>

- (void)addDueDateButtonTapped;
- (void)calculationInputReceivedWithRawInput:(NSString *)rawInput;

@end

@interface Presenter : NSObject <PresenterInterface>

@property (nonatomic, weak) id<View> view;
@property (nonatomic, strong) id<DateHelperInterface> dateHelper;

- (instancetype)initWithView:(id<View>)view dateHelper:(id<DateHelperInterface>)dateHelper;

@end
