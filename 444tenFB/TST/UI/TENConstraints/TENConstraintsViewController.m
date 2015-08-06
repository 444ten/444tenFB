//
//  TENConstraintsViewController.m
//  444tenFB
//
//  Created by 444ten on 8/6/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENConstraintsViewController.h"

@interface TENConstraintsViewController ()

@end

@implementation TENConstraintsViewController

- (IBAction)onButton:(UIButton *)sender {
    if ([[sender titleForState:UIControlStateNormal] isEqual:@"X"]) {
        [sender setTitle:@"A very long title for this button" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"X" forState:UIControlStateNormal];
        
    }
}

@end
