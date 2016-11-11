//
//  ViewController.m
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 09..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import "DateHelper.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAddPopup)];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)showAddPopup {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Estimate please" message:@"Please specify an estimation(a number)" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:nil];
    __weak typeof(self) weakSelf = self;
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf convertWithText: alertController.textFields[0].text];
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (NSDate *)convertWithText:(NSString *)text {
    DateHelper *helper = [DateHelper new];
    return [helper calculateDueDateWithSubmitTime:[NSDate date] turnaroundTimeInHours:text.integerValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
