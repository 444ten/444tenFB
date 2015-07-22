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
    UIWindow *window = [UIWindow window];
    self.window = window;

    TENUserViewController *controller = [TENUserViewController controller];
    
//    TSTFriendView *friendView = [UINib objectWithClass:[TSTFriendView class]];
//    TSTFriendView *friendView = [TSTFriendView new];
//    friendView.backgroundColor = [UIColor yellowColor];
//    
//    controller.view = friendView;
    
    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
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
