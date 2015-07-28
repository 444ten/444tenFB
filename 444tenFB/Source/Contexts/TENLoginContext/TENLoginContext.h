//
//  TENLoginContext.h
//  444tenFB
//
//  Created by Andrey Ten on 7/21/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENContext.h"

@class TENUser;

@interface TENLoginContext : TENContext
@property (nonatomic, strong)   TENUser *model;

- (NSArray *)permissions;

- (void)logout;

@end
