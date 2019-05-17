#
# Be sure to run `pod lib lint wb-util.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'wb-util'
  s.version          = '1.3.4'
  s.summary          = 'My utils used for develop'
  s.description      = 'v1.3.4 更新MJRefresh、MJExtension版本，修改[MyUtil showTipText:]方法字体大小为18'

  s.homepage         = 'https://github.com/pwb1004/wb-util'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pang Weibo' => 'pwb1004@gmail.com' }
  s.source           = { :git => 'https://github.com/pwb1004/wb-util.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'wb-util/Classes/**/*'
  
  # s.resource_bundles = {
  #   'wb-util' => ['wb-util/Assets/*.png']
  # }

  s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 3.2.1'
  s.dependency 'LBXAlertAction', '~> 1.1.1'
  s.dependency 'Masonry', '~> 1.1.0'
  s.dependency 'MBProgressHUD', '~> 1.1.0'
  s.dependency 'MJExtension', '~> 3.0.17'
  s.dependency 'MJRefresh', '~> 3.2.0'
  s.dependency 'TPKeyboardAvoiding', '~> 1.3.2'
end
