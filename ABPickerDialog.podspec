#
# Be sure to run `pod lib lint ABPickerDialog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ABPickerDialog'
  s.version          = '0.1.2'
  s.summary          = 'Dialog for picking values'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Custom dialogs for picking date, time, countries, random strings, etc.
                       DESC

  s.homepage         = 'https://github.com/alexburtnik/ABPickerDialog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexburtnik' => 'alexburtnik@gmail.com' }
  s.source           = { :git => 'https://github.com/alexburtnik/ABPickerDialog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ABPickerDialog/Classes/**/*'
  s.resource_bundles = {
     'ABPickerDialog' => ['ABPickerDialog/Classes/**/*.xib']
  }
  # s.resource_bundles = ['ABPickerDialog/Classes/**/*.xib']
  
  # s.resource_bundles = {
  #   'ABPickerDialog' => ['ABPickerDialog/Classes//*.xib']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
