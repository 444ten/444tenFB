//
//  DBUser.h
//  444tenFB
//
//  Created by 444ten on 8/3/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPicture, DBUser;

@interface DBUser : NSManagedObject

@property (nonatomic, strong) NSString  *userID;
@property (nonatomic, strong) NSString  *firstName;
@property (nonatomic, strong) NSString  *lastName;
@property (nonatomic, strong) DBPicture *picture;
@property (nonatomic, strong) NSSet     *friends;
@end

@interface DBUser (CoreDataGeneratedAccessors)

- (void)addFriend:(DBUser *)value;
- (void)removeFriend:(DBUser *)value;

- (void)addFriends:(NSSet *)values;
- (void)removeFriends:(NSSet *)values;

@end
