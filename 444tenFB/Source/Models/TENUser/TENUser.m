//
//  TENUser.m
//  444tenFB
//
//  Created by Andrey Ten on 7/21/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TENUser.h"

#import "TENOrderedModel.h"

@implementation TENUser

#pragma mark -
#pragma mark - Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.friends = [TENOrderedModel new];
    }
    
    return self;
}

@end
