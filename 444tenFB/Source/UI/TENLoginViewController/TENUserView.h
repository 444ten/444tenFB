//
//  TENUserView.h
//  444tenFB
//
//  Created by Andrey Ten on 7/30/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENImageModel.h"

@interface TENUserView : UIView <TENModelObserver>
@property (nonatomic, strong)   IBOutlet UIImageView    *userImageView;

@property (nonatomic, strong)   TENImageModel   *userImageModel;

- (void)fillWithModel:(TENImageModel *)model;

@end
