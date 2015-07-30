//
//  TENFacebookUserContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/27/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENFacebookUserContext.h"

#import "TENFacebookKey.h"
#import "TENUser.h"

static NSString * const kTENGraphPath   = @"me?fields=id,first_name,last_name,picture";

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
    
    NSString *picturePath = result[kTENPicture][kTENData][kTENUrl];
    
    user.pictureURL = [NSURL URLWithString:picturePath];
    
    return YES;
}

@end
