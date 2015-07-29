//
//  TENFacebookContext.h
//  444tenFB
//
//  Created by Andrey Ten on 7/24/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENContext.h"

@class TENModel;

@interface TENFacebookContext : TENContext
@property (nonatomic, strong)   TENModel    *model;

- (NSString *)graphPath;

- (BOOL)parseResult:(id)result;

@end
