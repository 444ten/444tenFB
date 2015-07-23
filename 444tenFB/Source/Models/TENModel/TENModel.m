//
//  TENModel.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENModel.h"

@implementation TENModel

#pragma mark -
#pragma mark Overload

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TENModelUnloaded:
            return @selector(modelDidUnload:);
        case TENModelWillLoad:
            return @selector(modelWillLoad:);
        case TENModelLoaded:
            return @selector(modelDidLoad:);
        case TENModelDidFailLoad:
            return @selector(modelDidFailLoad:);
        case TENModelChanged:
            return @selector(model:didChangeWithUsersInfo:);

        default:
            [super selectorForState:state];
    }
    
    return NULL;
}

@end
