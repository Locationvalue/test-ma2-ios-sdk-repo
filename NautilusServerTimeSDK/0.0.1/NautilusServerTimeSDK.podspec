Pod::Spec.new do |spec|
  spec.name         = "NautilusServerTimeSDK"
  spec.version      = "0.0.1"
  spec.summary      = "ModuleApps 2.0 Server Time SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Server Time SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/ServerTime/Sources/*.{h,m}", "Nautilus-ios-sdk/ServerTime/Sources/**/*.swift", "Nautilus-ios-sdk/ServerTime/Sources/**/*.{h,m}"
    spec.exclude_files = "Nautilus-ios-sdk/ServerTime/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/ServerTime/Resources/moduleapps-servertime.json", "Nautilus-ios-sdk/ServerTime/Resources/Nautilus.plist", "Nautilus-ios-sdk/ServerTime/Resources/Nautilus_*.plist"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusServerTimeSDK.xcframework'
  end

  spec.frameworks = 'UIKit'
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusConfigSDK", "#{spec.version}"
  spec.dependency "NautilusLoggingSDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
