//
//  UIAlertController+Extensions.m
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 11..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import "UIAlertController+Extensions.h"

@implementation UIAlertController (Extensions)

+ (instancetype)errorPopupWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    return alert;
}

+ (instancetype)successPopupWithMessage:(NSString *)message title:(NSString *)title {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    return alert;
}

@end
