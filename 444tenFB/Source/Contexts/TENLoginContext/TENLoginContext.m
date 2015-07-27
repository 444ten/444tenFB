//
//  TENLoginContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/21/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit.h>
#import <FBSDKLoginKit.h>

#import "TENLoginContext.h"

#import "TENUser.h"
#import "TENFacebookUserContext.h"

@interface TENLoginContext ()
@property (nonatomic, readonly) FBSDKLoginManager       *loginManager;
@property (nonatomic, strong)   TENFacebookUserContext  *context;


- (FBSDKLoginManagerRequestTokenHandler)handler;

@end

@implementation TENLoginContext

#pragma mark -
#pragma mark - Accessors

- (FBSDKLoginManager *)loginManager {
    return [FBSDKLoginManager new];
}

- (void)setContext:(TENFacebookUserContext *)context {
    if (context != _context) {
        [_context cancel];
        
        _context = context;
        
        _context.model = self.model;
        [_context execute];
    }
}

#pragma mark -
#pragma mark - Public

- (NSArray *)permissions {
    return @[@"public_profile", @"user_friends"];
}

#pragma mark -
#pragma mark - Overload

- (void)execute {
    self.model.state = TENModelWillLoad;
    [self.loginManager logInWithReadPermissions:[self permissions] handler:[self handler]];
}

- (void)cancel {
    [self.loginManager logOut];
}

#pragma mark -
#pragma mark - Private

- (FBSDKLoginManagerRequestTokenHandler)handler {
    return ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        TENUser *user = self.model;
        
        if (nil != error || result.isCancelled) {
            user.state  = TENModelDidFailLoad;
        } else {
            user.userID = result.token.userID;
            self.context = [TENFacebookUserContext new];
        }
    };
}

@end
