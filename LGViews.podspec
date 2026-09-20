Pod::Spec.new do |s|
    s.name = 'LGViews'
    s.version = '1.0.2'
    s.platform = :ios, '6.0'
    s.license = 'MIT'
    s.homepage = 'https://github.com/LGLibs/LGViews'
    s.author = { 'Grigorii Lutkov' => 'grigorii@lutkov.dev' }
    s.source = { :git => 'https://github.com/LGLibs/LGViews.git', :tag => s.version }
    s.summary = 'Classes extends abilities of UILabel, UIButton, UITextField and UITextView. Plus iOS implementation of radio buttons.'
    s.requires_arc = true
    s.source_files = 'LGViews/*.{h,m}'
    s.source_files = 'LGViews/**/*.{h,m}'
end
