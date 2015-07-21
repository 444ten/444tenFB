//
//  TSTFriendView.m
//  444tenFB
//
//  Created by Andrey Ten on 7/19/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TSTFriendView.h"

@interface TSTFriendView ()

- (void)initSubviews;

@end

@implementation TSTFriendView

#pragma mark -
#pragma mark Initializations and Deallocation

- (void)dealloc {
    self.contentImageView = nil;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.contentImageView) {
        [self initSubviews];
    }
}

#pragma mark -
#pragma mark Accessors

- (void)setContentImageView:(UIImageView *)contentImageView {
    if (contentImageView != _contentImageView) {
        [_contentImageView removeFromSuperview];
        
        _contentImageView = contentImageView;
        [self addSubview:_contentImageView];
    }
}

#pragma mark -
#pragma mark View Lifecycle


#pragma mark -
#pragma mark Private

- (void)initSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask  = UIViewAutoresizingFlexibleBottomMargin
                                | UIViewAutoresizingFlexibleTopMargin
                                | UIViewAutoresizingFlexibleLeftMargin
                                | UIViewAutoresizingFlexibleRightMargin
                                | UIViewAutoresizingFlexibleHeight
                                | UIViewAutoresizingFlexibleWidth;
    
    self.contentImageView = imageView;
}

@end
