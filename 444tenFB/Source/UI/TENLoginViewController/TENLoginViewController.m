//
//  TENLoginViewController.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TENLoginViewController.h"

#import "TENLoginContext.h"
#import "TENFriendsViewController.h"
#import "TENLoginView.h"
#import "TENMacro.h"
#import "TENThread.h"

static NSString * const TENLoginViewControllerTitle  = @"Login";

TENViewControllerBaseViewProperty(TENLoginViewController, loginView, TENLoginView);

@interface TENLoginViewController ()
@property (nonatomic, strong)   TENUser *user;

- (void)pushNextIfLogin;
- (void)pushNextController;

@end

@implementation TENLoginViewController

#pragma mark -
#pragma mark - Initiualizations and Deallocations

- (void)dealloc {
    self.user = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(TENUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        
        _user = user;
        [_user addObserver:self];
    }
}

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
    TENUser *user = [TENUser new];
    self.user = user;
    
    TENLoginContext *loginContext = [TENLoginContext new];
    loginContext.user = user;
    
    [loginContext execute];
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

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(TENUser *)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        [self.loginView fillWithModel:model];
    });
}

@end
