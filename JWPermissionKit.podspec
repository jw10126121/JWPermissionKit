#
# Be sure to run `pod lib lint JWAdjustablePositionButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'JWPermissionKit'
    s.version          = '0.0.3'
    s.summary          = 'App权限管理'
    s.homepage         = 'https://github.com/jw10126121/JWPermissionKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'jw10126121' => '10126121@qq.com' }
    s.source           = { :git => 'https://github.com/jw10126121/JWPermissionKit.git', :tag => s.version.to_s }
    s.source_files = 'JWPermissionKit/Classes/**/*.swift'
    s.ios.deployment_target = '9.0'
    s.swift_versions = ['4.2', '5.0']
    
    
    
    
end
