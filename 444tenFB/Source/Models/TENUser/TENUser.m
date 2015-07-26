//
//  TENUser.m
//  444tenFB
//
//  Created by Andrey Ten on 7/21/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TENUser.h"

#import "TENFriends.h"

@implementation TENUser

#pragma mark -
#pragma mark - Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.friends = [TENFriends new];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Public

- (void)fillFromFBSDKProfile {
    FBSDKProfile *profile = [FBSDKProfile currentProfile];
    
    self.userID = profile.userID;
    self.firstName = profile.firstName;
    self.lastName  = profile.lastName;
}

@end
