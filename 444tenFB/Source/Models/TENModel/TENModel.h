//
//  TENModel.h
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENObservableObject.h"

typedef NS_ENUM(NSUInteger, TENModelState) {
    TENModelUnloaded,
    TENModelWillLoad,
    TENModelLoaded,
    TENModelDidFailLoad
};

@protocol TENModelObserver

@optional
- (void)modelDidUnload:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoad:(id)model;

@end

@interface TENModel : TENObservableObject

@end
