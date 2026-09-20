//
// LGTextFieldDelegateObject.h
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <Foundation/Foundation.h>
#import "LGTextField.h"

@interface LGTextFieldDelegateObject : NSObject <UITextFieldDelegate>

@property (assign, nonatomic) id<LGTextFieldDelegate> delegateLG;

@end
