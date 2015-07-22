//
//  TENLoginViewController.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TENLoginViewController.h"

#import "TENFriendsViewController.h"
#import "TENLoginView.h"
#import "TENMacro.h"

static NSString * const TENLoginViewControllerTitle  = @"Login";

TENViewControllerBaseViewProperty(TENLoginViewController, loginView, TENLoginView);

@interface TENLoginViewController ()

- (void)pushNextIfLogin;
- (void)pushNextController;

@end

@implementation TENLoginViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = TENLoginViewControllerTitle;
    
    [self pushNextIfLogin];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    
}

#pragma mark -
#pragma mark Private

- (void)pushNextIfLogin {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (nil != token) {
        [self.loginView setLogoutConfiguration];
        [self pushNextController];
    }
}

- (void)pushNextController {
    TENFriendsViewController *controller = [TENFriendsViewController new];
    
    [self.navigationController pushViewController:controller animated:NO];
}

@end
