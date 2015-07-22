//
//  TENLoginContext.m
//  444tenFB
//
//  Created by Andrey Ten on 7/21/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENLoginContext.h"

#import <FBSDKCoreKit.h>
#import <FBSDKLoginKit.h>

#import "TENUser.h"

@interface TENLoginContext ()
@property (nonatomic, strong)   id  result;

- (void)loginAndPerformRequest;
- (void)parsing;

@end

@implementation TENLoginContext

#pragma mark -
#pragma mark - Public

- (void)execute {
    [self loginAndPerformRequest];
}

#pragma mark -
#pragma mark - Private

- (void)loginAndPerformRequest {
    NSArray *permissions = @[@"email", @"user_friends"];
    
    FBSDKLoginManager *login = [FBSDKLoginManager new];
    [login logInWithReadPermissions: permissions handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (nil != error || result.isCancelled) {
            return;
        }
        
        NSString *graphPath = @"me?fields=id,first_name,last_name,picture";
        FBSDKGraphRequest *request =[[FBSDKGraphRequest alloc] initWithGraphPath:graphPath parameters:nil];
        
        void(^completionHandler)(id, id , id) = ^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if (nil == error) {
                self.result = result;
                [self parsing];
            }
        };
        
        [request startWithCompletionHandler:completionHandler];
    }];
    
}

- (void)parsing {
    TENUser *user = self.user;
    NSDictionary *result = self.result;
    
    
    user.userID = [result objectForKey: @"id"];
    user.firstName = [result objectForKey: @"first_name"];
    user.lastName = [result objectForKey: @"last_name"];
    
    NSDictionary *dictionary = [[result objectForKey:@"picture"] objectForKey:@"data"];
    user.pictureUrl = [dictionary objectForKey: @"url"];
}

@end
