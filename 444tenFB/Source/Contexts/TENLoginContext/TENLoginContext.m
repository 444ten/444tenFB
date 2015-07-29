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

#import "TENFacebookKey.h"
#import "TENFacebookUserContext.h"
#import "TENMacro.h"
#import "TENUser.h"

@interface TENLoginContext ()
@property (nonatomic, readonly) FBSDKLoginManager       *loginManager;
@property (nonatomic, strong)   TENFacebookUserContext  *context;

- (void)loadModel;

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
    return @[kTENPermissionPublicProfile, kTENPermissionUserFriends];
}

#pragma mark -
#pragma mark - Overload

- (void)execute {
    self.model.state = TENModelWillLoad;
    if ([FBSDKAccessToken currentAccessToken]) {
        [self loadModel];
    } else {
        [self.loginManager logInWithReadPermissions:[self permissions] handler:[self handler]];
    }
}

- (void)cancel {

}

#pragma mark -
#pragma mark - Private

- (void)loadModel {
    self.context = [TENFacebookUserContext new];
}

- (FBSDKLoginManagerRequestTokenHandler)handler {
    TENWeakify(self);
    return ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        TENStrongify(self);
        TENUser *user = self.model;
        
        if (nil != error || result.isCancelled) {
            user.state  = TENModelDidFailLoad;
        } else {
            [self loadModel];
        }
    };
}

@end
