//
//  TENFriendsContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/23/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit.h>
#import <FBSDKLoginKit.h>

#import "TENFriendsContext.h"

#import "TENFriends.h"
#import "TENUser.h"

@interface TENFriendsContext ()

- (void)parseResult:(id)result;
- (void)notify;

@end

@implementation TENFriendsContext

#pragma mark -
#pragma mark - Public

- (void)execute {
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me/friends" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 [self parseResult:result];
             }
         }];
    }
}

#pragma mark -
#pragma mark - Private

- (void)parseResult:(NSDictionary *)result {
    NSArray *array = result[@"data"];
    TENFriends *friends = self.friends;
    
    for (NSDictionary *object in array) {
        TENUser *user = [TENUser new];

        user.userID = object[@"id"];
        user.name = object[@"name"];
        
        [friends addObject:user];
    }
    
    [self notify];
}

- (void)notify {
    self.friends.state = TENModelLoaded;
}

@end
