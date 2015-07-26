//
//  TENLoginView.h
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <UIKit/UIKit.h>

#import "TENView.h"

@class TENUser;

@interface TENLoginView : TENView
@property (nonatomic, strong)   IBOutlet FBSDKProfilePictureView    *profilePictureView;
@property (nonatomic, strong)   IBOutlet UILabel                    *firstNameLabel;
@property (nonatomic, strong)   IBOutlet UILabel                    *lastNameLabel;
@property (nonatomic, strong)   IBOutlet UIButton                   *loginButton;
@property (nonatomic, strong)   IBOutlet UIButton                   *friendsButton;

- (void)fillWithModel:(id)model;

@end
