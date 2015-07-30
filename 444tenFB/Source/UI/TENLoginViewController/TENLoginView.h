//
//  TENLoginView.h
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENView.h"

@class TENUser;
@class TENUserView;

@interface TENLoginView : TENView
@property (nonatomic, strong)   IBOutlet TENUserView    *userView;
@property (nonatomic, strong)   IBOutlet UILabel        *firstNameLabel;
@property (nonatomic, strong)   IBOutlet UILabel        *lastNameLabel;
@property (nonatomic, strong)   IBOutlet UIButton       *logInOutButton;
@property (nonatomic, strong)   IBOutlet UIButton       *friendsButton;
@property (nonatomic, strong)   IBOutlet UILabel        *userID;

- (void)fillWithModel:(id)model;

@end
