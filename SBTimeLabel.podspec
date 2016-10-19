#
# Be sure to run `pod lib lint SBTimeLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SBTimeLabel'
  s.version          = '1.0.1'
  s.summary          = 'A short description of SBTimeLabel.'
  s.module_name      = 'SBTimeLabel'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Label that displays elapsed time (Stopwatch, Countdown, Current Time)
                       DESC

  s.homepage         = 'https://github.com/iworkinprogress/SBTimeLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Steven Baughman' => 'steve@iworkinprogress.com' }
  s.source           = { :git => 'https://github.com/iworkinprogress/SBTimeLabel.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iworkinprogress'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SBTimeLabel/SBTimeLabel/**/*'
  
end
