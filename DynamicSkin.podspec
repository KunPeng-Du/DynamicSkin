Pod::Spec.new do |s|
    s.name         = 'DynamicSkin'
    s.version      = '1.0.0'
    s.summary      = 'An easy way to change skin or theme of your app'
    s.homepage     = 'https://github.com/KunPeng-Du/DynamicSkin'
    s.license      = 'MIT'
    s.authors      = {'Peng Du' => 'coder_pengdu@126.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/KunPeng-Du/DynamicSkin.git', :tag => s.version}
    s.source_files = 'DynamicSkin/DynamicSkin/DynamicSkin/**/*.{h,m}'
    s.resource     = 'DynamicSkin/DynamicSkin/DynamicSkin.bundle'
    s.requires_arc = true
end