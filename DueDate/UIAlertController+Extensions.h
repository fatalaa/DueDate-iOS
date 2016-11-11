//
//  UIAlertController+Extensions.h
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 11..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extensions)

+ (instancetype)errorPopupWithMessage:(NSString *)message;
+ (instancetype)successPopupWithMessage:(NSString *)message title:(NSString *)title;

@end
