//
// LGTextViewDelegateObject.h
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <Foundation/Foundation.h>
#import "LGTextView.h"

@interface LGTextViewDelegateObject : NSObject <UITextViewDelegate>

@property (assign, nonatomic) id<LGTextViewDelegate> delegateLG;

- (void)textViewWillResize:(LGTextView *)textView toSize:(CGSize)sizeNew;
- (void)textViewResizing:(LGTextView *)textView toSize:(CGSize)sizeNew;
- (void)textViewDidResize:(LGTextView *)textView;

@end
