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
#import "TENFacebookUserContext.h"

static NSString * const TENLoginViewControllerTitle  = @"Login";

TENViewControllerBaseViewProperty(TENLoginViewController, loginView, TENLoginView);

@interface TENLoginViewController ()
@property (nonatomic, strong)   TENUser         *user;
@property (nonatomic, strong)   TENLoginContext *context;

- (void)fillWithModel:(id)model;

- (void)pushFriendsViewControllerAnimated:(BOOL)animated;

@end

@implementation TENLoginViewController

#pragma mark -
#pragma mark - Initiualizations and Deallocations

- (void)dealloc {
    self.user = nil;
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(TENUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        
        _user = user;
        [_user addObserver:self];
        
        [self fillWithModel:_user];
        
        if (nil != _user) {
            self.context = [TENLoginContext new];
        }
    }
    
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
    
    self.user = [TENUser new];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLogInOutButton:(id)sender {
    TENUser *user = self.user;
    
    if (TENModelLoaded == user.state) {
        [[FBSDKLoginManager new] logOut];
        user = nil;
    } else {
        user = [TENUser new];
    }
    
    self.user = user;
}

- (IBAction)onFriendsButton:(id)sender {
    [self pushFriendsViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(id)model {
    [self.loginView fillWithModel:model];
}


- (void)pushFriendsViewControllerAnimated:(BOOL)animated {
    TENFriendsViewController *controller = [TENFriendsViewController new];
    controller.user = self.user;
    
    [self.navigationController pushViewController:controller animated:animated];
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(TENUser *)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        self.context = nil;
        [self fillWithModel:model];
        [self pushFriendsViewControllerAnimated:NO];
    });
}

@end
