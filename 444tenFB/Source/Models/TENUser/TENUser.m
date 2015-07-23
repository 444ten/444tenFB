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

@implementation TENUser

#pragma mark -
#pragma mark - Class Methods

#pragma mark -
#pragma mark - Initializations and Deallocations

#pragma mark -
#pragma mark - Public

- (void)fillFromFBSDKProfile {
    FBSDKProfile *profile = [FBSDKProfile currentProfile];
    
    self.userID = profile.userID;
    self.firstName = profile.firstName;
    self.lastName  = profile.lastName;
}

@end
