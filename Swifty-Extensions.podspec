#
# Be sure to run `pod lib lint Swifty-Extensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Swifty-Extensions'
  s.version          = '0.1.0'
  s.summary          = 'Useful swift extensions for different classes'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Useful swift extensions for different classes like Array, Bool, Dictionary, NSDate, NSTimer, UIColor, UIAlertController etc
DESC

  s.homepage         = 'https://github.com/milanpanchal/Swifty-Extensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Milan Panchal' => 'sam07it22@gmail.com' }
  s.source           = { :git => 'https://github.com/milanpanchal/Swifty-Extensions.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/milan_panchal24'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Swifty-Extensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Swifty-Extensions' => ['Swifty-Extensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
