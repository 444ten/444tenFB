//
//  TENFacebookFriendsContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/24/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENFacebookFriendsContext.h"

#import "TENFriends.h"
#import "TENUser.h"

@implementation TENFacebookFriendsContext

#pragma mark -
#pragma mark Overload

- (NSString *)graphPath {
    return @"me/friends";
}

- (BOOL)parseResult:(NSDictionary *)result {
    if (nil != result[@"error"]) {
        return NO;
    }
    
    NSArray *array = result[@"data"];
    TENFriends *friends = (TENFriends *)self.model;
    
    [friends removeAllObjects];
    
    for (NSDictionary *object in array) {
        TENUser *user = [TENUser new];
        
        user.userID = object[@"id"];
        user.name = object[@"name"];
        
        [friends addObject:user];
    }

    return YES;
}

@end
