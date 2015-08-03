//
//  TENFacebookUserContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/27/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENFacebookUserContext.h"

#import "TENFacebookKeys.h"
#import "TENUser.h"

static NSString * const kTENGraphPathFormat     = @"me?fields=id,first_name,last_name,picture.width(%lu)";
static const NSUInteger TENDefaultPictureWidth  = 50;

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
    NSUInteger pictureWidth = self.pictureSize.width;
    
    if (0 == pictureWidth) {
        pictureWidth = TENDefaultPictureWidth;
    }
    
    return [NSString stringWithFormat:kTENGraphPathFormat, pictureWidth];
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
