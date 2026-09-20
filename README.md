# LGViews

Classes extends abilities of UILabel, UIButton, UITextField and UITextView.
- [LGLabel](./LGViews/LGLabel/LGLabel.h) adds ability to set contentEdgeInsets.
- [LGButton](./LGViews/LGButton/LGButton.h) adds ability to set background color for every control state, to easy choose image position (top, right, bottom, left) and to support for masked (not rectangle) forms.
- [LGTextField](./LGViews/LGTextField/LGTextField.h) adds ability to set edgeInsets for text and images, to set max length of text and to get caret position or caret rect.
- [LGTextView](./LGViews/LGTextView/LGTextView.h) adds ability to dynamic change height of view while typing text, to set max height, number of lines, placeholder and to get caret position or caret rect.
- [LGRadioButtonsView](./LGViews/LGRadioButtonsView/LGRadioButtonsView.h) - iOS implementation of radio buttons.

## Preview

<img src="https://raw.githubusercontent.com/LGLibs/ReadmeFiles/master/LGViews/Preview.gif" width="218"/> <img src="https://raw.githubusercontent.com/LGLibs/ReadmeFiles/master/LGViews/1.png" width="218"/> <img src="https://raw.githubusercontent.com/LGLibs/ReadmeFiles/master/LGViews/2.png" width="218"/> <img src="https://raw.githubusercontent.com/LGLibs/ReadmeFiles/master/LGViews/3.png" width="218"/> <img src="https://raw.githubusercontent.com/LGLibs/ReadmeFiles/master/LGViews/4.png" width="218"/> <img src="https://raw.githubusercontent.com/LGLibs/ReadmeFiles/master/LGViews/5.png" width="218"/>

## Installation

### With source code

[Download repository](https://github.com/LGLibs/LGViews/archive/master.zip), then add [LGViews directory](./LGViews) to your project.

### With CocoaPods

CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. To install with cocoaPods, follow the "Get Started" section on [CocoaPods](https://cocoapods.org).

#### Podfile
```ruby
platform :ios, '6.0'
pod 'LGViews', '~> 1.0.0'
```

### With Carthage

Carthage is a lightweight dependency manager for Swift and Objective-C. It leverages CocoaTouch modules and is less invasive than CocoaPods. To install with carthage, follow the instruction on [Carthage](https://github.com/Carthage/Carthage).

#### Cartfile
```
github "LGLibs/LGViews" ~> 1.0.0
```

## Usage

In the source files where you need to use the library, import the header file:

```objective-c
#import "LGViews.h"
```

Or you can use sublibraries separately, depend of your needs:

```objective-c
#import "LGLabel.h"
#import "LGButton.h"
#import "LGTextField.h"
#import "LGTextView.h"
#import "LGRadioButtonsView.h"
```

### More

For more details try [Xcode Demo Project](./Demo) and see files:
- [LGLabel.h](./LGViews/LGLabel/LGLabel.h)
- [LGButton.h](./LGViews/LGButton/LGButton.h)
- [LGTextField.h](./LGViews/LGTextField/LGTextField.h)
- [LGTextView.h](./LGViews/LGTextView/LGTextView.h)
- [LGRadioButtonsView.h](./LGViews/LGRadioButtonsView/LGRadioButtonsView.h)

## Repos / Mirrors

- [TRULAB](https://trulab.ru/LGLibs/LGViews)
- [GitHub](https://github.com/LGLibs/LGViews)
- [GitLab](https://gitlab.com/LGLibs/LGViews)
- [Gitea](https://gitea.com/LGLibs/LGViews)

## License

Copyright (c) 2015 Grigorii Lutkov \<grigorii@lutkov.dev\>

Licensed under the [MIT License](./LICENSE)
