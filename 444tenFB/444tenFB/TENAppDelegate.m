//
//  TENAppDelegate.m
//  444tenFB
//
//  Created by Andrey Ten on 7/18/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENAppDelegate.h"

#import "UIViewController+TENExtensions.h"
#import "UIWindow+TENExtensions.h"

#import "TENTestViewController.h"

@interface TENAppDelegate ()

@end

@implementation TENAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

    TENTestViewController *controller = [TENTestViewController controller];
    
    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
