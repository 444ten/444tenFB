//
//  TENFriendsViewController.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENFriendsViewController.h"

#import "UITableView+TENExtensions.h"

#import "TENFriendCell.h"
#import "TENFriendsContext.h"
#import "TENFriendsView.h"
#import "TENMacro.h"
#import "TENThread.h"
#import "TENUser.h"

TENViewControllerBaseViewProperty(TENFriendsViewController, friendsView, TENFriendsView);

@interface TENFriendsViewController ()
@property (nonatomic, strong)   TENFriends  *friends;

@end

@implementation TENFriendsViewController

#pragma mark -
#pragma mark Accessors

- (void)setFriends:(TENFriends *)friends {
    if (friends != _friends) {
        [_friends removeObserver:self];
        
        _friends = friends;
        [_friends addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TENFriends *friends = [TENFriends new];
    self.friends = friends;
    
    TENFriendsContext *friendsContext = [TENFriendsContext new];
    friendsContext.friends = friends;
    
    [friendsContext execute];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.friends count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TENFriendCell *cell = [tableView cellWithClass:[TENFriendCell class]];
    
    TENUser *user = self.friends[indexPath.row];
    [cell fillWithModel:user];
    
    return cell;
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(TENUser *)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        [self.friendsView.friendsTableView reloadData];
    });
}

@end
