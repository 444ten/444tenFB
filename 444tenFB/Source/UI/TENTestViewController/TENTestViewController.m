//
//  TENTestViewController.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/6/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENTestViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TENLoginContext.h"
#import "TENUser.h"

@interface TENTestViewController () <FBSDKLoginButtonDelegate>

@end

@implementation TENTestViewController 

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    TENUser *user = [TENUser new];
    
    TENLoginContext *loginContext = [TENLoginContext new];
    loginContext.model = user;
    
    [loginContext execute];
    
    
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = self.view.center;
//    loginButton.delegate = self;
//    
//    [self.view addSubview:loginButton];
}


#pragma mark -
#pragma mark FBSDKLoginButtonDelegate

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

@end
