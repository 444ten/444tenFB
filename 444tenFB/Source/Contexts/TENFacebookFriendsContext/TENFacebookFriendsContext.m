//
//  TENFacebookFriendsContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/24/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENFacebookFriendsContext.h"

#import "TENFacebookKeys.h"
#import "TENOrderedModel.h"
#import "TENUser.h"

static NSString * const kTENGraphPath   = @"me/friends";

@interface TENFacebookFriendsContext ()
@property (nonatomic, readonly) TENOrderedModel *friends;

@end

@implementation TENFacebookFriendsContext

@dynamic friends;

#pragma mark -
#pragma mark Accesors

- (TENOrderedModel *)friends {
    return (TENOrderedModel *)self.model;
}

#pragma mark -
#pragma mark Overload

- (NSString *)graphPath {
    return kTENGraphPath;
}

- (BOOL)parseResult:(NSDictionary *)result {
    if (nil != result[kTENError]) {
        return NO;
    }
    
    NSArray *array = result[kTENData];
    TENOrderedModel *friends = self.friends;
    
    [friends removeAllObjects];
    
    for (NSDictionary *object in array) {
        TENUser *user = [TENUser new];
        
        user.userID = object[kTENID];
        user.name = object[kTENName];
        
        [friends addObject:user];
    }

    return YES;
}

@end
