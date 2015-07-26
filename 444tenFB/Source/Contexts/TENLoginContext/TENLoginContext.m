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

@interface TENLoginContext ()
@property (nonatomic, readonly)     FBSDKLoginManager   *loginManager;

- (FBSDKLoginManagerRequestTokenHandler)handler;

@end

@implementation TENLoginContext

#pragma mark -
#pragma mark - Accessors

- (FBSDKLoginManager *)loginManager {
    return [FBSDKLoginManager new];
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
            user.state = TENModelLoaded;
        }
    };
}

@end
