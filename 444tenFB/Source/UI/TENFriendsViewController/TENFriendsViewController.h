//
//  TENFriendsViewController.h
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENOrderedModel.h"
#import "TENViewController.h"

@interface TENFriendsViewController : TENViewController <TENModelObserver>
@property (nonatomic, strong)  TENOrderedModel  *friends;

@end
