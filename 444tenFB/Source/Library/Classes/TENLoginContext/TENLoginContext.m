//
//  TENLoginContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/21/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENLoginContext.h"

#import <FBSDKLoginKit.h>

@implementation TENLoginContext

#pragma mark -
#pragma mark - Public

- (void)execute {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if ([result.grantedPermissions containsObject:@"email"]) {
                // Do work
            }
        }
    }];
}


@end
