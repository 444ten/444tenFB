//
//  TENUserView.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENUserView.h"

#import "TENUser.h"

@implementation TENUserView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setContext:(TENLoginContext *)context {
    if (context != _context) {
        [_context removeObserver:self];
        
        _context = context;
        [_context addObserver:self];
        
        [self fillWithContext:_context];
        [_context execute];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithContext:(TENLoginContext *)context {
    TENUser *user = context.user;
    
    self.firstNameLabel.text = user.firstName;
    self.lastNameLabel.text = user.lastName;
}


#pragma mark -
#pragma mark TENContextObserver

- (void)contextDidExecute:(TENLoginContext *)context {
    [self fillWithContext:context];
}

@end
