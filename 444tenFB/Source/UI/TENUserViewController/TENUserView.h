//
//  TENUserView.h
//  444tenFB
//
//  Created by Andrey Ten on 7/22/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENLoginContext.h"

@interface TENUserView : UIView <TENContextObserver>
@property (nonatomic, strong)   IBOutlet UILabel    *firstNameLabel;
@property (nonatomic, strong)   IBOutlet UILabel    *lastNameLabel;

@property (nonatomic, strong)   TENLoginContext *context;

- (void)fillWithContext:(TENLoginContext *)context;

@end
