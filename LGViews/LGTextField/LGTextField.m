//
// LGTextField.m
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import "LGTextField.h"
#import "LGTextFieldDelegateObject.h"

@interface LGTextField ()

@property (strong, nonatomic) LGTextFieldDelegateObject *delegateObject;

@end

@implementation LGTextField

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self initialize];
}

- (void)initialize
{
    CGFloat inset = 8.f;

    _textEdgeInsets = UIEdgeInsetsMake(0.f, inset, 0.f, inset);
    _leftViewEdgeInsets = UIEdgeInsetsMake(0.f, inset, 0.f, 0.f);
    _rightViewEdgeInsets = UIEdgeInsetsMake(0.f, 0.f, 0.f, inset);

    [self createDelegateObject];
}

- (void)createDelegateObject
{
    if (!_delegateObject)
    {
        _delegateObject = [LGTextFieldDelegateObject new];
        [super setDelegate:_delegateObject];
    }
}

#pragma mark - Dealloc

- (void)dealloc
{
    _delegateObject = nil;
    self.delegateLG = nil;
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (self.leftView)
    {
        CGFloat heightDif = self.frame.size.height-_leftViewEdgeInsets.top-_leftViewEdgeInsets.bottom;

        self.leftView.center = CGPointMake(self.leftView.center.x+_leftViewEdgeInsets.left, _leftViewEdgeInsets.top+heightDif/2);
    }

    if (self.rightView)
    {
        CGFloat heightDif = self.frame.size.height-_rightViewEdgeInsets.top-_rightViewEdgeInsets.bottom;

        self.rightView.center = CGPointMake(self.rightView.center.x-_rightViewEdgeInsets.right, _rightViewEdgeInsets.top+heightDif/2);
    }
}

#pragma mark -

- (CGRect)textRectForBounds:(CGRect)bounds
{
    bounds.origin.x += _textEdgeInsets.left;
    bounds.origin.y += _textEdgeInsets.top;
    bounds.size.width -= (_textEdgeInsets.left + _textEdgeInsets.right);
    bounds.size.height -= (_textEdgeInsets.top + _textEdgeInsets.bottom);

    if (self.leftView)
    {
        bounds.origin.x += (self.leftView.frame.size.width+_leftViewEdgeInsets.left+_leftViewEdgeInsets.right);
        bounds.size.width -= (self.leftView.frame.size.width+_leftViewEdgeInsets.left+_leftViewEdgeInsets.right);
    }
    if (self.rightView) bounds.size.width -= (self.rightView.frame.size.width+_rightViewEdgeInsets.left+_rightViewEdgeInsets.right);

    return bounds;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    bounds.origin.x += _textEdgeInsets.left;
    bounds.origin.y += _textEdgeInsets.top;
    bounds.size.width -= (_textEdgeInsets.left + _textEdgeInsets.right);
    bounds.size.height -= (_textEdgeInsets.top + _textEdgeInsets.bottom);

    if (self.leftView)
    {
        bounds.origin.x += (self.leftView.frame.size.width+_leftViewEdgeInsets.left+_leftViewEdgeInsets.right);
        bounds.size.width -= (self.leftView.frame.size.width+_leftViewEdgeInsets.left+_leftViewEdgeInsets.right);
    }
    if (self.rightView) bounds.size.width -= (self.rightView.frame.size.width+_rightViewEdgeInsets.left+_rightViewEdgeInsets.right);

    return bounds;
}

#pragma mark - LGTextField Delegate

- (void)setDelegateLG:(id<LGTextFieldDelegate>)delegateLG
{
    [self createDelegateObject];

    _delegateObject.delegateLG = delegateLG;
}

- (id<LGTextFieldDelegate>)delegateLG
{
    return _delegateObject.delegateLG;
}

#pragma mark -

- (CGRect)caretRect
{
    return [self caretRectForPosition:self.selectedTextRange.start];
}

- (CGPoint)caretPosition
{
    return [self caretRectForPosition:self.selectedTextRange.start].origin;
}

@end
