//
//  TENLoginViewController.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TENLoginViewController.h"

#import "TENLoginContext.h"
#import "TENFriendsViewController.h"
#import "TENLoginView.h"
#import "TENMacro.h"
#import "TENThread.h"

static NSString * const TENLoginViewControllerTitle  = @"Login";

TENViewControllerBaseViewProperty(TENLoginViewController, loginView, TENLoginView);

@interface TENLoginViewController ()
@property (nonatomic, strong)   TENUser         *user;
@property (nonatomic, strong)   TENLoginContext *context;

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
    
    [self.loginView fillWithModel:_user];
}

- (void)setContext:(TENLoginContext *)context {
    if (context != _context) {
        [_context cancel];
        
        _context = context;
        
        _context.model = self.user;
        [_context execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = TENLoginViewControllerTitle;
    [self.loginView fillWithModel:self.user];;
    
    [self pushNextIfLogin];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    if (nil != self.user) {
        self.user = nil;
        [self.context cancel];
    } else {
        self.user = [TENUser new];
        self.context = [TENLoginContext new];
    }
}

- (IBAction)onFriendsButton:(id)sender {
    [self pushNextController];
}

#pragma mark -
#pragma mark Private

- (void)pushNextIfLogin {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (nil != token) {
        self.user = [TENUser new];
        [self pushNextController];
    }
}

- (void)pushNextController {
    TENFriendsViewController *controller = [TENFriendsViewController new];
    controller.friends = self.user.friends;
    
    [self.navigationController pushViewController:controller animated:NO];
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(TENUser *)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
//        self.context = nil;
        self.user = model;
    });
}

@end
