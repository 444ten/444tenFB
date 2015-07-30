//
//  TENUserView.m
//  444tenFB
//
//  Created by Andrey Ten on 7/30/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENUserView.h"

#import "TENMacro.h"
#import "TENThread.h"


@implementation TENUserView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.userImageModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUserImageModel:(TENImageModel *)userImageModel {
    if (_userImageModel != userImageModel) {
        [_userImageModel removeObserver:self];
        
        _userImageModel = userImageModel;
        [_userImageModel addObserver:self];
        
        
        [self fillWithModel:userImageModel];
        [_userImageModel load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TENImageModel *)model {
    self.userImageView.image = model.image;
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(TENImageModel *)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        [self fillWithModel:model];
    });
}

@end
