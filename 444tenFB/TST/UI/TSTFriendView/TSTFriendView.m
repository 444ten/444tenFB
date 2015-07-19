//
//  TSTFriendView.m
//  444tenFB
//
//  Created by Andrey Ten on 7/19/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TSTFriendView.h"

@interface TSTFriendView ()
@property (nonatomic, strong)   UIImageView     *imageView;

- (void)initSubviews;

@end

@implementation TSTFriendView

#pragma mark -
#pragma mark Initializations and Deallocation

- (void)dealloc {
    
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

#pragma mark -
#pragma mark Private

- (void)initSubviews {
    UIImageView *imageView = [UIImageView new];
    self.imageView = imageView;
    [self addSubview:imageView];
    
    [self setNeedsLayout];
}

@end
