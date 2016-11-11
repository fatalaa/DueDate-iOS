//
//  ViewController.m
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 09..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import "DateHelper.h"
#import "Presenter.h"
#import "UIAlertController+Extensions.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAddPopup)];
}

- (void)showErrorMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController errorPopupWithMessage:message];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showResult:(NSString *)message {
    UIAlertController *alert = [UIAlertController successPopupWithMessage:message title:@"Result"];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showAddPopup {
    [self.presenter addDueDateButtonTapped];
}

- (void)showInputField {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Estimate please" message:@"Please specify an estimation(a number)" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    __weak typeof(self) weakSelf = self;
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.presenter calculationInputReceivedWithRawInput:alertController.textFields[0].text];
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
