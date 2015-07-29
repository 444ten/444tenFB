//
//  TENUser.h
//  444tenFB
//
//  Created by Andrey Ten on 7/21/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENModel.h"

@class TENOrderedModel;

@interface TENUser : TENModel
@property (nonatomic, copy)     NSString        *userID;
@property (nonatomic, copy)     NSString        *firstName;
@property (nonatomic, copy)     NSString        *lastName;
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, strong)   TENOrderedModel *friends;

@end
