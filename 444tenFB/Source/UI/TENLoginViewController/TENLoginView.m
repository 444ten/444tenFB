//
//  TENLoginView.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENLoginView.h"

#import "TENUser.h"

static NSString * const kLogin  = @"Log in";
static NSString * const kLogout = @"Log out";

@implementation TENLoginView

#pragma mark -
#pragma mark Public

- (void)setLoginConfiguration {
    [self.loginButton setTitle:kLogin forState:UIControlStateNormal];
}

- (void)setLogoutConfiguration {
    [self.loginButton setTitle:kLogout forState:UIControlStateNormal];
}

- (void)fillWithModel:(TENUser *)model {
    self.firstNameLabel.text = model.firstName;
    self.lastNameLabel.text = model.lastName;
}

@end
