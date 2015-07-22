//
//  TENContext.h
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENObservableObject.h"

typedef NS_ENUM(NSUInteger, TENContextState) {
    TENContextCanceling,
    TENContextExecuted,
    TENContextDidFailExecuting
};

@protocol TENContextObserver

@optional
- (void)contextDidCancel:(id)context;
- (void)contextDidExecute:(id)context;
- (void)contextDidFailExecute:(id)context;

@end

@interface TENContext : TENObservableObject

@end
