Pod::Spec.new do |s|
    s.name             = 'MyLib'
    s.version          = '0.1.1'
    s.summary          = 'xiaoe ShareSDK'
    s.homepage         = 'https://github.com/haovbvb/MyLib'
    
    s.platform     = :ios, '9.0'
    s.ios.deployment_target = '9.0'
    s.requires_arc = true
    s.swift_version = '5.0.0'
    
    s.source           = { :git => 'https://github.com/haovbvb/MyLib.git', :tag => s.version.to_s }

    s.source_files = 'MyLib/**/*.{swift}'

s.dependency 'XECoreService', '1.0.2'
    
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'page' => 'email201111@qq.com' }
    
end

