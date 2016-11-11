//
//  ViewController.h
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 09..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol View <NSObject>

- (void)showErrorMessage:(NSString *)message;
- (void)showResult:(NSString *)message;
- (void)showInputField;

@end

@protocol PresenterInterface;

@interface ViewController : UIViewController <View>

@property (nonatomic, strong) id<PresenterInterface> presenter;

@end

