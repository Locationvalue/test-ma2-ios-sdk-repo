Pod::Spec.new do |spec|
  spec.name         = "NautilusContentSDK"
  spec.version      = "1.14.0"
  spec.summary      = "ModuleApps 2.0 Content Component SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Content Component SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Content/Sources/*.{h,m}", "Nautilus-ios-sdk/Content/Sources/**/*.swift", "Nautilus-ios-sdk/Content/Sources/**/*.{h,m}", "Nautilus-ios-sdk/Content/Sources/**/*.storyboard"
    spec.exclude_files = "Nautilus-ios-sdk/Content/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/Content/Resources/moduleapps-contents.json", "Nautilus-ios-sdk/Content/Sources/**/*.xib", "Nautilus-ios-sdk/Content/Sources/**/*.xcdatamodeld", "Nautilus-ios-sdk/Content/Resources/Assets.xcassets"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusContentSDK.xcframework'
  end

  spec.frameworks = 'Foundation'
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusConfigSDK", "#{spec.version}"
  spec.dependency "NautilusIdentifySDK", "#{spec.version}"
  spec.dependency "NautilusImagingSDK", "#{spec.version}"
  spec.dependency "NautilusAnalyticsSDK", "#{spec.version}"
  spec.dependency "NautilusLoggingSDK", "#{spec.version}"
  spec.dependency "NautilusUISDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
