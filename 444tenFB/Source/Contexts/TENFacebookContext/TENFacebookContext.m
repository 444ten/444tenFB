//
//  TENFacebookContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/24/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TENFacebookContext.h"

#import "TENModel.h"

@interface TENFacebookContext ()
@property (nonatomic, readonly) FBSDKGraphRequest           *graphRequest;
@property (nonatomic, strong)   FBSDKGraphRequestConnection *connection;

- (FBSDKGraphRequestHandler)completionHandler;

@end

@implementation TENFacebookContext

#pragma mark -
#pragma mark Accessors

- (FBSDKGraphRequest *)graphRequest {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:[self graphPath] parameters:nil];
}

#pragma mark -
#pragma mark Overload

- (void)execute {
    TENModel *model = self.model;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        model.state = TENModelWillLoad;
        self.connection = [self.graphRequest startWithCompletionHandler:[self completionHandler]];
    } else {
        model.state = TENModelDidFailLoad;
    }
}

- (void)cancel {
    [self.connection cancel];
}

#pragma mark -
#pragma mark Public

- (NSString *)graphPath {
    return @"me";
}

- (BOOL)parseResult:(NSDictionary *)result {
    return NO;
}

#pragma mark -
#pragma mark Private

- (FBSDKGraphRequestHandler)completionHandler {
    return ^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        self.model.state = (nil == error  && [self parseResult:result]) ? TENModelLoaded : TENModelDidFailLoad;
    };
}

@end
