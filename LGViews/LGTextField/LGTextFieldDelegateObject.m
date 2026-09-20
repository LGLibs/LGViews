//
// LGTextFieldDelegateObject.m
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import "LGTextFieldDelegateObject.h"

@implementation LGTextFieldDelegateObject

#pragma mark - Dealloc

- (void)dealloc
{
    _delegateLG = nil;
}

#pragma mark - UITextField Delegate

- (BOOL)textField:(LGTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger lengthOld = textField.text.length;
    NSUInteger lengthReplacement = string.length;
    NSUInteger lengthRange = range.length;

    NSUInteger lengthNew = lengthOld - lengthRange + lengthReplacement;

    if ([string isEqualToString:@"\n"]) return NO;

    if (!textField.hasText && [string isEqualToString:@""]) return NO;

    BOOL delegateResult = YES;

    if (_delegateLG && [_delegateLG respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)])
        delegateResult = [_delegateLG textField:textField shouldChangeCharactersInRange:range replacementString:string];

    return (delegateResult && (lengthNew <= textField.lengthMax || textField.lengthMax == 0));
}

- (BOOL)textFieldShouldBeginEditing:(LGTextField *)textField
{
    BOOL delegateResult = YES;

    if (_delegateLG && [_delegateLG respondsToSelector:@selector(textFieldShouldBeginEditing:)])
        delegateResult = [_delegateLG textFieldShouldBeginEditing:textField];

    return delegateResult;
}

- (BOOL)textFieldShouldEndEditing:(LGTextField *)textField
{
    if (textField.isTrimmingWhitespaceAndNewline)
        textField.text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    BOOL delegateResult = YES;

    if (_delegateLG && [_delegateLG respondsToSelector:@selector(textFieldShouldEndEditing:)])
        delegateResult = [_delegateLG textFieldShouldEndEditing:textField];

    return delegateResult;
}

- (BOOL)textFieldShouldReturn:(LGTextField *)textField
{
    if (textField.returnKeyType == UIReturnKeyDone)
        [textField resignFirstResponder];

    BOOL delegateResult = YES;

    if (_delegateLG && [_delegateLG respondsToSelector:@selector(textFieldShouldReturn:)])
        delegateResult = [_delegateLG textFieldShouldReturn:textField];

    return delegateResult;
}

- (BOOL)textFieldShouldClear:(LGTextField *)textField
{
    BOOL delegateResult = YES;

    if (_delegateLG && [_delegateLG respondsToSelector:@selector(textFieldShouldClear:)])
        delegateResult = [_delegateLG textFieldShouldClear:textField];

    return delegateResult;
}

- (void)textFieldDidBeginEditing:(LGTextField *)textField
{
    if (_delegateLG && [_delegateLG respondsToSelector:@selector(textFieldDidBeginEditing:)])
        [_delegateLG textFieldDidBeginEditing:textField];
}

- (void)textFieldDidEndEditing:(LGTextField *)textField
{
    if (_delegateLG && [_delegateLG respondsToSelector:@selector(textFieldDidEndEditing:)])
        [_delegateLG textFieldDidEndEditing:textField];
}

@end
