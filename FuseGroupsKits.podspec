#
# Be sure to run `pod lib lint FuseGroupsKits.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FuseGroupsKits'
  s.version          = '1.0.6'
  s.summary          = 'A short description of FuseGroupsKits.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wintersweet/FuseGroupsKits'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wintersweet' => 'hudongdong@fuse.co.id' }
  s.source           = { :git => 'https://github.com/wintersweet/FuseGroupsKits.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

#  s.source_files = 'FuseGroupsKits/Classes/BaseComponent/**/*'
  path = 'FuseGroupsKits/Classes/BaseComponent/'
  s.subspec 'BaseComponent' do |t|
      t.subspec 'FuseLogin' do |login|
        login.source_files = path +'FuseLogin/*'
        end
      t.subspec 'FuTextField' do |tf|
         tf.source_files = path +'FUSelectTextField/*'
         end
      t.subspec 'FuGrowTextView' do |tv|
           tv.source_files = path +'GrowTextView/*'
           tv.public_header_files = path + 'GrowTextView/*.{h}'

         end
      t.subspec 'MBNullSafe' do |s|
          s.source_files = path +'MBNullSafe/*'
          s.public_header_files = path + 'MBNullSafe/*.{h}'
         end
      t.subspec 'FusePermission' do |p|
          p.source_files = path +'FusePermission/*'
          p.public_header_files = path + 'FusePermission/*.{h}'
         end
     end
  
  #s.resource_bundles = {
  #    'FuseGroupsKits' => ['FuseGroupsKits/Assets/*.png']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  #  s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency 'CTMediator'
  s.dependency 'CTMediaKit'
  s.dependency 'YYModel'

end
