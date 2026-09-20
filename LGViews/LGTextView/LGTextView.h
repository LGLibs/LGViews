//
// LGTextView.h
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>

@class LGTextView;

@protocol LGTextViewDelegate <NSObject>

@optional

- (BOOL)textViewShouldBeginEditing:(LGTextView *)textView;
- (BOOL)textViewShouldEndEditing:(LGTextView *)textView;

- (void)textViewDidBeginEditing:(LGTextView *)textView;
- (void)textViewDidEndEditing:(LGTextView *)textView;

- (BOOL)textView:(LGTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)textViewDidChange:(LGTextView *)textView;

- (void)textViewDidChangeSelection:(LGTextView *)textView;

- (BOOL)textView:(LGTextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0);
- (BOOL)textView:(LGTextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0);

- (void)textViewWillResize:(LGTextView *)textView toSize:(CGSize)sizeNew;
- (void)textViewResizing:(LGTextView *)textView toSize:(CGSize)sizeNew;
- (void)textViewDidResize:(LGTextView *)textView;

@end

IB_DESIGNABLE

@interface LGTextView : UITextView

@property (assign, nonatomic) id<LGTextViewDelegate> delegateLG;

@property (strong, nonatomic) IBInspectable NSString *placeholder;
@property (strong, nonatomic) IBInspectable UIColor  *placeholderColor;

@property (assign, nonatomic) IBInspectable NSUInteger numberOfLinesMin;
@property (assign, nonatomic) IBInspectable NSUInteger numberOfLinesMax;
@property (assign, nonatomic) IBInspectable CGFloat    heightMin;
@property (assign, nonatomic) IBInspectable CGFloat    heightMax;

@property (assign, nonatomic) IBInspectable NSUInteger lengthMax;

@property (assign, nonatomic, getter=isAnimatedResize) IBInspectable BOOL animatedResize;

@property (assign, nonatomic, getter=isTrimmingWhitespaceAndNewline) IBInspectable BOOL trimmingWhitespaceAndNewline;

/** Do not forget about weak referens to self */
@property (strong, nonatomic) void (^willResizeHandler)(LGTextView *textView, CGSize sizeNew);
/** Do not forget about weak referens to self */
@property (strong, nonatomic) void (^resizingHandler)(LGTextView *textView, CGSize sizeNew);
/** Do not forget about weak referens to self */
@property (strong, nonatomic) void (^didResizeHandler)(LGTextView *textView);

- (NSUInteger)numberOfLines;
- (void)resize;

- (CGRect)caretRect;
- (CGPoint)caretPosition;

/** Delegate not available, use delegateLG instead */
- (id<UITextViewDelegate>)delegate __attribute__((unavailable("use delegateLG instead")));
/** Delegate not available, use setDelegateLG instead */
- (void)setDelegate:(id<UITextViewDelegate>)delegate __attribute__((unavailable("use setDelegateLG instead")));

@end
