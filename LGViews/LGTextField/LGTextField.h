//
// LGTextField.h
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>

@class LGTextField;

@protocol LGTextFieldDelegate <NSObject>

@optional

- (BOOL)textFieldShouldBeginEditing:(LGTextField *)textField; // return NO to disallow editing.
- (void)textFieldDidBeginEditing:(LGTextField *)textField;    // became first responder
- (BOOL)textFieldShouldEndEditing:(LGTextField *)textField;   // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(LGTextField *)textField;      // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textField:(LGTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string; // return NO to not change text

- (BOOL)textFieldShouldClear:(LGTextField *)textField;        // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(LGTextField *)textField;       // called when 'return' key pressed. return NO to ignore.

@end

IB_DESIGNABLE

@interface LGTextField : UITextField

@property (assign, nonatomic) IBOutlet id<LGTextFieldDelegate> delegateLG;

@property (assign, nonatomic) IBInspectable NSUInteger lengthMax;

@property (assign, nonatomic) IBInspectable UIEdgeInsets textEdgeInsets;
@property (assign, nonatomic) IBInspectable UIEdgeInsets leftViewEdgeInsets;
@property (assign, nonatomic) IBInspectable UIEdgeInsets rightViewEdgeInsets;

@property (assign, nonatomic, getter=isTrimmingWhitespaceAndNewline) IBInspectable BOOL trimmingWhitespaceAndNewline;

- (CGRect)caretRect;
- (CGPoint)caretPosition;

/** Delegate not available, use delegateLG instead */
- (id<UITextFieldDelegate>)delegate __attribute__((unavailable("use delegateLG instead")));
/** Delegate not available, use setDelegateLG instead */
- (void)setDelegate:(id<UITextFieldDelegate>)delegate __attribute__((unavailable("use setDelegateLG instead")));

@end
