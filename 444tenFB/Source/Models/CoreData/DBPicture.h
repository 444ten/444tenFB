//
//  DBPicture.h
//  444tenFB
//
//  Created by 444ten on 8/3/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBUser;

@interface DBPicture : NSManagedObject

@property (nonatomic, strong) NSString  *path;
@property (nonatomic, strong) DBUser    *user;

@end
