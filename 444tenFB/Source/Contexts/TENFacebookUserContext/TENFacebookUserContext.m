//
//  TENFacebookUserContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/27/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENFacebookUserContext.h"

#import "TENUser.h"

@implementation TENFacebookUserContext

#pragma mark -
#pragma mark Overload

- (NSString *)graphPath {
    return @"me?fields=id,first_name,last_name";
}

- (BOOL)parseResult:(NSDictionary *)result {
    if (nil != result[@"error"]) {
        return NO;
    }
    
    TENUser *user = (TENUser *)self.model;
    user.firstName = result[@"first_name"];
    user.lastName = result[@"last_name"];
    
    return YES;
}

@end
