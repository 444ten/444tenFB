//
//  TENFriendsContext.h
//  444tenFB
//
//  Created by Andrey Ten on 7/23/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENContext.h"

@class TENFriends;

@interface TENFriendsContext : TENContext
@property (nonatomic, strong)   TENFriends *friends;

@end
