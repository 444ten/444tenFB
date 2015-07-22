//
//  TENContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENContext.h"

@implementation TENContext

#pragma mark -
#pragma mark Overload

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TENContextCanceling:
            return @selector(contextDidCancel:);
        case TENContextExecuted:
            return @selector(contextDidExecute:);
        case TENContextDidFailExecuting:
            return @selector(contextDidFailExecute:);
            
        default:
            [super selectorForState:state];
    }
    
    return NULL;
}

@end
