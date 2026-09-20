//
// LGButton.h
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface LGButton : UIButton

typedef NS_ENUM(NSUInteger, LGButtonImagePosition)
{
    LGButtonImagePositionLeft   = 0,
    LGButtonImagePositionRight  = 1,
    LGButtonImagePositionTop    = 2,
    LGButtonImagePositionBottom = 3,
    LGButtonImagePositionCenter = 4
};

typedef NS_ENUM(NSUInteger, LGButtonTitlePosition)
{
    LGButtonTitlePositionRight  = 0,
    LGButtonTitlePositionLeft   = 1,
    LGButtonTitlePositionBottom = 2,
    LGButtonTitlePositionTop    = 3,
    LGButtonTitlePositionCenter = 4
};

@property (assign, nonatomic) IBInspectable LGButtonImagePosition imagePosition;
/** Default is 6.f */
@property (assign, nonatomic) IBInspectable CGFloat imageSpacingFromTitle;
@property (assign, nonatomic) IBInspectable CGPoint imageOffset;

@property (assign, nonatomic) IBInspectable LGButtonTitlePosition titlePosition;
/** Default is 6.f */
@property (assign, nonatomic) IBInspectable CGFloat titleSpacingFromImage;
@property (assign, nonatomic) IBInspectable CGPoint titleOffset;

@property (strong, nonatomic, readonly) IBInspectable UIImage *maskImage;

@property (assign, nonatomic, getter=isTitleLabelWidthUnlimited)    IBInspectable BOOL titleLabelWidthUnlimited;
@property (assign, nonatomic, getter=isAdjustsAlphaWhenHighlighted) IBInspectable BOOL adjustsAlphaWhenHighlighted;
@property (assign, nonatomic, getter=isAnimatedStateChanging)       IBInspectable BOOL animatedStateChanging;

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

- (void)setMaskAlphaImage:(UIImage *)maskImage;
- (void)setMaskBlackAndWhiteImage:(UIImage *)maskImage;

@end
