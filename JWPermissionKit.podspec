#
# Be sure to run `pod lib lint JWAdjustablePositionButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'JWPermissionKit'
    s.version          = '0.0.1'
    s.summary          = 'App权限管理'
    s.homepage         = 'https://github.com/jw10126121/JWPermissionKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'jw10126121' => '10126121@qq.com' }
    s.source           = { :git => 'https://github.com/jw10126121/JWPermissionKit.git', :tag => s.version.to_s }
    ## s.source_files = 'JWPermissionKit/Classes/**/*.swift'
    s.ios.deployment_target = '9.0'
    s.swift_versions = ['4.2', '5.0']
    
    s.default_subspec = 'Core'
    s.subspec 'Core' do |co|
        co.source_files = 'JWPermissionKit/Classes/Core/**/*.swift'
    end
    
    #s.subspec 'RxSwift' do |rx|
    #    rx.source_files = 'JWPermissionKit/Classes/RxSwift/**/*.swift'
    #   rx.dependency 'JWPermissionKit/Core'
    #   rx.dependency 'RxSwift'
    #end
    
    s.subspec 'Photos' do |ph|
        ph.dependency 'JWPermissionKit/Core'
        ph.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "JW_PERMISSION_PHOTOS" }
    end
    
    s.subspec 'Microphone' do |mi|
        mi.dependency 'JWPermissionKit/Core'
        mi.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "JW_PERMISSION_MICROPHONE" }
    end
    
    s.subspec 'Camera' do |cm|
        cm.dependency 'JWPermissionKit/Core'
        cm.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "JW_PERMISSION_CAMERA" }
    end
    
    
end
