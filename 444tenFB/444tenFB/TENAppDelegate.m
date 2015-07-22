//
//  TENAppDelegate.m
//  444tenFB
//
//  Created by Andrey Ten on 7/18/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENAppDelegate.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TENUserViewController.h"
#import "TENTestViewController.h"

#import "TSTFriendView.h"

#import "UINib+TENExtensions.h"
#import "UIViewController+TENExtensions.h"
#import "UIWindow+TENExtensions.h"

@interface TENAppDelegate ()

@end

@implementation TENAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL result = [[FBSDKApplicationDelegate sharedInstance] application:application
                                           didFinishLaunchingWithOptions:launchOptions];
    
    UIWindow *window = [UIWindow window];
    self.window = window;

    TENUserViewController *controller = [TENUserViewController controller];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    
    return result;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

@end
