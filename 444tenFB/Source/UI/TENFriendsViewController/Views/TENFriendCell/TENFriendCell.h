//
//  TENFriendCell.h
//  444tenFB
//
//  Created by Andrey Ten on 7/23/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TENTableViewCell.h"

@class TENUser;

@interface TENFriendCell : TENTableViewCell
@property (nonatomic, strong)   IBOutlet FBSDKProfilePictureView    *profileView;
@property (nonatomic, strong)   IBOutlet UILabel                    *nameLabel;

- (void)fillWithModel:(id)model;

@end
