
Pod::Spec.new do |s|
  s.name             = 'OPGFeedbackSDK'
  s.version          = '0.1.6'
  s.summary          = 'OPGFeedbackSDK Pod.'

  s.description      = <<-DESC
The OnePoint Global Mobile App SDK allows you to build your own research capabilities into mobile applications.
                       DESC

  s.homepage         = 'https://github.com/OnePointGlobal/OPGFeedbackSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors           = { 'manjunath.ramesh@onepointglobal.com' => 'manjunath.ramesh@onepointglobal.com', 'chinthan.m@onepointglobal.com' => 'chinthan.m@onepointglobal.com' }
  s.source           = { :git => 'https://github.com/OnePointGlobal/OPGFeedbackSDK.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'
  s.ios.vendored_library = 'lib/libOnePointSDK.a', 'lib/libOnePoint.Runtime.a'


  s.source_files = "include/OPGSDK/*.h", "include/OPGSDK/Other Supporting Files/*.h" ,"include/OnePoint.Runtime/*.h"
  s.public_header_files = "include/OPGSDK/*.h", "include/OPGSDK/Other Supporting Files/*.h","include/OnePoint.Runtime/*.h"
  
  s.resource_bundles = {
    'OPGFeedbackSDK' => ['OPGFeedbackSDK/Assets/OPGResourceBundle.bundle']
  }

  s.resources = "OPGFeedbackSDK/Assets/OPGResourceBundle.bundle"

   s.xcconfig = { 'HEADER_SEARCH_PATHS' => '/usr/include/libxml2', 'OTHER_LDFLAGS' => '-lxml2 -lz -ObjC'}
   s.library = 'xml2', 'c++', 'iconv', 'z'
end
