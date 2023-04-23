# Uncomment the next line to define a global platform for your project
 platform :ios, '15.0'

target 'Anime Tracker' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Anime Tracker
  pod 'CoreLib', :path => 'Development Pods/CoreLib'
  pod 'LoginFeature', :path => 'Development Pods/LoginFeature'
  pod 'LoginService', :path => 'Development Pods/LoginService'
  pod 'MALSwift', :path => 'Development Pods/MALSwift'
  pod 'LandingFeature', :path => 'Development Pods/LandingFeature'
  
  target 'Anime TrackerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Anime TrackerUITests' do
    # Pods for testing
  end

  # disable code signing
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
        target.build_configurations.each do |config|
          config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        end
      end
    end
  end
end
