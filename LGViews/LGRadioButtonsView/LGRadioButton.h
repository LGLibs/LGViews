//
// LGRadioButton.h
// LGViews
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>

@interface LGRadioButton : UIButton

typedef NS_ENUM(NSUInteger, LGRadioButtonImagePosition)
{
    LGRadioButtonImagePositionLeft  = 0,
    LGRadioButtonImagePositionRight = 1
};

typedef NS_ENUM(NSUInteger, LGRadioButtonTitlePosition)
{
    LGRadioButtonTitlePositionRight = 0,
    LGRadioButtonTitlePositionLeft  = 1
};

@property (assign, nonatomic) LGRadioButtonImagePosition imagePosition;
/** Default is 6.f */
@property (assign, nonatomic) CGFloat imageSpacingFromTitle;
@property (assign, nonatomic) CGPoint imageOffset;

@property (assign, nonatomic) LGRadioButtonTitlePosition titlePosition;
/** Default is 6.f */
@property (assign, nonatomic) CGFloat titleSpacingFromImage;
@property (assign, nonatomic) CGPoint titleOffset;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
