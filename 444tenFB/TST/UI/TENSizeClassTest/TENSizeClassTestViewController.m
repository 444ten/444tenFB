//
//  TENSizeClassTestViewController.m
//  444tenFB
//
//  Created by 444ten on 8/6/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENSizeClassTestViewController.h"

@interface TENSizeClassTestViewController ()
- (void)configureView;

@end

@implementation TENSizeClassTestViewController

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
//    [self configureView];
}

#pragma mark -
#pragma mark Private

- (void)configureView {
    UIDevice *device = [UIDevice currentDevice];
    UIDeviceOrientation orientation = device.orientation;
    
    if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
        CGRect rect = self.topLeftView.frame;
        rect.size.width = 254;
        rect.size.height = 130;
        self.topLeftView.frame = rect;
        
        rect = self.topRightView.frame;
        rect.origin.x = 294;
        rect.size.width = 254;
        rect.size.height = 130;
        self.topRightView.frame = rect;
        
        rect = self.bottomView.frame;
        rect.origin.y = 170;
        rect.size.width = 528;
        rect.size.height = 130;
        self.bottomView.frame = rect;
        
    } else {
        
        CGRect rect = self.topLeftView.frame;
        rect.size.width = 130;
        rect.size.height = 254;
        self.topLeftView.frame = rect;
        
        rect = self.topRightView.frame;
        rect.origin.x = 170;
        rect.size.width = 130;
        rect.size.height = 254;
        self.topRightView.frame = rect;
        
        rect = self.bottomView.frame;
        rect.origin.y = 295;
        rect.size.width = 280;
        rect.size.height = 254;
        self.bottomView.frame = rect;
    }
}

@end
