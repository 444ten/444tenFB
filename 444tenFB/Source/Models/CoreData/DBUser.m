//
//  DBUser.m
//  444tenFB
//
//  Created by 444ten on 8/3/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "DBUser.h"
#import "DBPicture.h"

#import "IDPObjCRuntime.h"
#import "NSManagedObject+IDPExtensions.h"

@implementation DBUser

@dynamic userID;
@dynamic firstName;
@dynamic lastName;
@dynamic picture;
@dynamic friends;

#pragma mark -
#pragma mark Accessors

- (void)addFriend:(DBUser *)value {
    [self addCustomValue:value inMutableSetForKey:IDPStringFromSEL(friends)];
}

- (void)removeFriend:(DBUser *)value {
    [self removeCustomValue:value inMutableSetForKey:IDPStringFromSEL(friends)];
}

@end
