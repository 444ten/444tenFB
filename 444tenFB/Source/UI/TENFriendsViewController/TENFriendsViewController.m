//
//  TENFriendsViewController.m
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

// testUserEmail:tom_xvnxsgq_cruise@tfbnw.net password:123

#import "TENFriendsViewController.h"

#import "UITableView+TENExtensions.h"

#import "TENFriendCell.h"
#import "TENFacebookFriendsContext.h"
#import "TENFriendsView.h"
#import "TENMacro.h"
#import "TENThread.h"
#import "TENUser.h"

TENViewControllerBaseViewProperty(TENFriendsViewController, friendsView, TENFriendsView);

@interface TENFriendsViewController ()
@property (nonatomic, strong)   TENFacebookFriendsContext   *context;

@end

@implementation TENFriendsViewController

#pragma mark -
#pragma mark Accessors

- (void)setFriends:(TENOrderedModel *)friends {
    if (friends != _friends) {
        [_friends removeObserver:self];
        
        _friends = friends;
        [_friends addObserver:self];
    }
}

- (void)setContext:(TENFacebookFriendsContext *)context {
    if (context != _context) {
        [_context cancel];
        
        _context = context;
        
        _context.model = self.friends;
        [_context execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.context = [TENFacebookFriendsContext new];
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
        
//        TENOrderedModel *friends = self.user.friends;
//        for (NSUInteger iterator = 0; iterator < 1000; iterator++) {
////            [friends addObject:friends[arc4random() % 4]];
//            [friends addObject:friends[0]];
//        }
        
        [self.friendsView.friendsTableView reloadData];
    });
}

@end
