//
//  TENUser.h
//  444tenFB
//
//  Created by Andrey Ten on 7/21/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TENUser : NSObject
@property (nonatomic, strong)   NSString    *userID;
@property (nonatomic, strong)   NSString    *firstName;
@property (nonatomic, strong)   NSString    *lastName;

@property (nonatomic, strong)   NSURL       *pictureUrl;

@end
