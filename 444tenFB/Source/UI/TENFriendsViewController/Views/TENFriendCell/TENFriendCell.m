//
//  TENFriendCell.m
//  444tenFB
//
//  Created by Andrey Ten on 7/23/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENFriendCell.h"

#import "TENUser.h"

@implementation TENFriendCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TENUser *)user {
    self.nameLabel.text = user.name;
    self.profileView.profileID = user.userID;
}

@end
