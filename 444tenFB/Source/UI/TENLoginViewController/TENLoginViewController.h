//
//  TENLoginViewController.h
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENViewController.h"
#import "TENUser.h"

@interface TENLoginViewController : TENViewController <TENModelObserver>

- (IBAction)onLoginButton:(id)sender;

@end
