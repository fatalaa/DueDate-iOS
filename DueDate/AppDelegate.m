//
//  AppDelegate.m
//  DueDate
//
//  Created by Tibor Molnár on 2016. 11. 09..
//  Copyright © 2016. Tibor Molnár. All rights reserved.
//

#import "AppDelegate.h"
#import "DateHelper.h"
#import "Presenter.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *view = [ViewController new];
    id<PresenterInterface> presenter = [[Presenter alloc] initWithView:view
                                                            dateHelper:[DateHelper new]];
    view.presenter = presenter;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:view];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
