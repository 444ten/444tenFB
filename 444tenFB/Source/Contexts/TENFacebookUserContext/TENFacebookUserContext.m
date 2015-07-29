//
//  TENFacebookUserContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/27/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENFacebookUserContext.h"

#import "TENUser.h"

static NSString * const kTENGraphPath   = @"me?fields=id,first_name,last_name";
static NSString * const kTENFirstName   = @"first_name";
static NSString * const kTENLastName    = @"last_name";

@interface TENFacebookUserContext ()
@property (nonatomic, readonly) TENUser *user;

@end

@implementation TENFacebookUserContext

@dynamic user;

#pragma mark -
#pragma mark Accessors

- (TENUser *)user {
    return (TENUser *)self.model;
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
    
    TENUser *user = self.user;
    user.userID = result[kTENID];
    user.firstName = result[kTENFirstName];
    user.lastName = result[kTENLastName];
    
    return YES;
}

@end
