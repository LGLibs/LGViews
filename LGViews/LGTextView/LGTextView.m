//
// LGTextView.m
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import "LGTextView.h"
#import "LGTextViewDelegateObject.h"

static CGFloat const kResizeAnimationDuration = 0.15f;

// Do not forget about "protected"
@interface LGTextView ()

@property (strong, nonatomic) LGTextViewDelegateObject *delegateObject;
@property (assign, nonatomic, getter=isPlaceholderShowing) BOOL placeholderShowing;
@property (strong, nonatomic) UIColor *mainTextColor;

- (void)placeholderShow;
- (void)placeholderHide;

@end

@implementation LGTextView

#pragma mark -

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

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    _mainTextColor = [UIColor blackColor];
    _placeholderColor = [UIColor lightGrayColor];

    _numberOfLinesMin = 0;
    _numberOfLinesMax = 0;
    _heightMin = 0.f;
    _heightMax = 0.f;

    _animatedResize = YES;

    _delegateObject = [LGTextViewDelegateObject new];
    [super setDelegate:_delegateObject];

    self.alwaysBounceVertical = NO;
}

#pragma mark - Dealloc

- (void)dealloc
{
    self.delegateObject = nil;
    self.delegateLG = nil;
}

#pragma mark -

- (void)setTextColor:(UIColor *)textColor
{
    _mainTextColor = textColor;

    if (!self.isPlaceholderShowing)
        [super setTextColor:_mainTextColor];
}

- (void)setFont:(UIFont *)font
{
    if (![self.font isEqual:font])
    {
        if (_numberOfLinesMin) self.numberOfLinesMin = _numberOfLinesMin;
        if (_numberOfLinesMax) self.numberOfLinesMax = _numberOfLinesMax;

        [super setFont:font];
    }
}

- (CGSize)sizeThatFits:(CGSize)size
{
    if (_heightMin || _heightMax)
    {
        CGSize selfSize = [super sizeThatFits:size];

        selfSize.width = size.width;

        if (_heightMin && selfSize.height < _heightMin)
        {
            selfSize.height = _heightMin;

            self.scrollEnabled = NO;
        }
        else if (_heightMax && selfSize.height > _heightMax)
        {
            selfSize.height = _heightMax;

            self.scrollEnabled = YES;
        }
        else
            self.scrollEnabled = NO;

        return selfSize;
    }
    else return [super sizeThatFits:size];
}

#pragma mark - Placeholder

- (void)setPlaceholder:(NSString *)placeholder
{
    if (![_placeholder isEqualToString:placeholder])
    {
        _placeholder = placeholder;

        if (!self.text.length)
            [self placeholderShow];
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;

    if (self.isPlaceholderShowing)
        [super setTextColor:_placeholderColor];
}

- (void)placeholderShow
{
    if (_placeholder)
    {
        _placeholderShowing = YES;

        [super setTextColor:_placeholderColor];
        [super setText:_placeholder];
    }
}

- (void)placeholderHide
{
    if (_placeholder)
    {
        _placeholderShowing = NO;

        [super setTextColor:_mainTextColor];
        [super setText:@""];
    }
}

#pragma mark - Height

- (void)setNumberOfLinesMin:(NSUInteger)numberOfLinesMin
{
    _numberOfLinesMin = numberOfLinesMin;

    self.heightMin = self.font.lineHeight*_numberOfLinesMin+self.contentInset.top+self.contentInset.bottom+([UIDevice currentDevice].systemVersion.floatValue >= 7.0 ? self.textContainerInset.top+self.textContainerInset.bottom : 0.f);
}

- (void)setNumberOfLinesMax:(NSUInteger)numberOfLinesMax
{
    _numberOfLinesMax = numberOfLinesMax;

    self.heightMax = self.font.lineHeight*_numberOfLinesMax+self.contentInset.top+self.contentInset.bottom+([UIDevice currentDevice].systemVersion.floatValue >= 7.0 ? self.textContainerInset.top+self.textContainerInset.bottom : 0.f);
}

- (void)setHeightMin:(CGFloat)heightMin
{
    if (_heightMin != heightMin)
    {
        _heightMin = heightMin;

        [self sizeToFit];
        [self layoutIfNeeded];
    }

}

- (void)setHeightMax:(CGFloat)heightMax
{
    if (_heightMax != heightMax)
    {
        _heightMax = heightMax;

        [self sizeToFit];
        [self layoutIfNeeded];
    }
}

#pragma mark - Text

- (NSString *)text
{
    if (self.isPlaceholderShowing)
        return @"";
    else
        return [super text];
}

- (BOOL)hasText
{
    return (self.text.length > 0);
}

#pragma mark - LGTextView Delegate

- (void)setDelegateLG:(id<LGTextViewDelegate>)delegateLG
{
    _delegateObject.delegateLG = delegateLG;
}

- (id<LGTextViewDelegate>)delegateLG
{
    return _delegateObject.delegateLG;
}

#pragma mark -

- (void)resize
{
    if (_heightMin || _heightMax)
    {
        CGSize sizeOld = self.frame.size;
        CGSize sizeTemp = [self sizeThatFits:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)];
        CGRect frameNew = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, sizeTemp.height);
        if ([UIScreen mainScreen].scale == 1.f) frameNew = CGRectIntegral(frameNew);
        CGSize sizeNew = frameNew.size;

        if (!CGSizeEqualToSize(sizeOld, sizeNew))
        {
            [_delegateObject textViewWillResize:self toSize:sizeNew];

            if (_animatedResize)
            {
                [UIView animateWithDuration:kResizeAnimationDuration
                                 animations:^(void)
                 {
                     self.frame = frameNew;

                     [_delegateObject textViewResizing:self toSize:sizeNew];
                 }
                                 completion:^(BOOL finished)
                 {
                     [_delegateObject textViewDidResize:self];
                 }];
            }
            else
            {
                self.frame = frameNew;

                [_delegateObject textViewResizing:self toSize:sizeNew];

                [_delegateObject textViewDidResize:self];
            }
        }
    }
}

- (NSUInteger)numberOfLines
{
    return fabs(self.contentSize.height/self.font.lineHeight);
}

- (CGRect)caretRect
{
    return [self caretRectForPosition:self.selectedTextRange.start];
}

- (CGPoint)caretPosition
{
    return [self caretRectForPosition:self.selectedTextRange.start].origin;
}

@end
