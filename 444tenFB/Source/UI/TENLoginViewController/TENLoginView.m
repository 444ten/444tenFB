//
//  TENLoginView.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENLoginView.h"

#import "TENUser.h"
#import "TENUserView.h"

static NSString * const kLogin  = @"Log in";
static NSString * const kLogout = @"Log out";

@implementation TENLoginView

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TENUser *)model {
    self.friendsButton.hidden = (nil == model);
    
    [self.logInOutButton setTitle:(nil != model) ? kLogout : kLogin
                         forState:UIControlStateNormal];
    
    self.firstNameLabel.text = model.firstName;
    self.lastNameLabel.text = model.lastName;
    self.userID.text = model.userID;
    self.userView.userImageModel = model.imageModel ;
}

@end
