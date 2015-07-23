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
@property (nonatomic, readonly) NSArray     *permissions;

- (void)addNotifications;
- (void)removeNotifications;
- (void)performFBSDKProfileNotification:(id)object;

@end

@implementation TENLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self removeNotifications];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addNotifications];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Accessors

- (NSArray *)permissions {
    return @[@"public_profile"];
}

#pragma mark -
#pragma mark - Public

- (void)execute {
    [[FBSDKLoginManager new] logInWithReadPermissions: self.permissions
                                              handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                                  if (nil != error || result.isCancelled) {
                                                      NSLog(@"%@", error);
                                                      return;
                                                  }
                                              }];
}

#pragma mark -
#pragma mark - Private

- (void)addNotifications {
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(performFBSDKProfileNotification:)
                                                 name:FBSDKProfileDidChangeNotification
                                               object:nil];
}

- (void)removeNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:FBSDKProfileDidChangeNotification
                                                  object:nil];
}

- (void)performFBSDKProfileNotification:(NSNotification *)notification {
    [self.user fillFromFBSDKProfile];
    self.user.state = TENModelLoaded;
}

@end
