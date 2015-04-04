#
# Be sure to run `pod lib lint IDSymbolFont.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "IDSymbolFont"
  s.version          = "0.2.0"
  s.summary          = "A short description of IDSymbolFont."
  s.description      = <<-DESC
                       An optional longer description of IDSymbolFont

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/hayashi311/IDSymbolFont"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "ryota hayashi" => "hayashi311@gmail.com" }
  s.source           = { :git => "https://github.com/hayashi311/IDSymbolFont.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.resources = ['Pod/Assets/*.ttf']

  s.subspec 'Core' do |cs|
     cs.source_files = 'Pod/Classes/Core'
  end

  s.subspec 'UI' do |us|
     us.source_files = 'Pod/Classes/UI'
  end

  s.default_subspec = 'Core', 'UI'
  s.frameworks = 'UIKit', 'MapKit'
end
