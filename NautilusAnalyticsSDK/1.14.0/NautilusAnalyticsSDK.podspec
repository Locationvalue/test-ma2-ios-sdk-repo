Pod::Spec.new do |spec|
  spec.name         = "NautilusAnalyticsSDK"
  spec.version      = "1.14.0"
  spec.summary      = "ModuleApps 2.0 Analytics SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Analytics SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Analytics/Sources/*.{h,m}", "Nautilus-ios-sdk/Analytics/Sources/**/*.swift", "Nautilus-ios-sdk/Analytics/Sources/**/*.{h,m}"
    spec.exclude_files = "Nautilus-ios-sdk/Analytics/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/Analytics/Resources/Nautilus.plist", "Nautilus-ios-sdk/Analytics/Resources/Nautilus_*.plist"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusAnalyticsSDK.xcframework'
  end

  spec.frameworks = 'Foundation'
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusIdentifySDK", "#{spec.version}"
  spec.dependency "NautilusLoggingSDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
