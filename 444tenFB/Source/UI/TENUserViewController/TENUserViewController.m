//
//  TENUserViewController.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENUserViewController.h"

#import "TENLoginContext.h"
#import "TENMacro.h"
#import "TENUser.h"
#import "TENUserView.h"

TENViewControllerBaseViewProperty(TENUserViewController, userView, TENUserView);

@implementation TENUserViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TENUser *user = [TENUser new];
    self.user = user;
    
    TENLoginContext *loginContext = [TENLoginContext new];
    loginContext.user = user;
    
    self.userView.context = loginContext;
}

@end
