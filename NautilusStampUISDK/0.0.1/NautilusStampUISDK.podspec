Pod::Spec.new do |spec|
  spec.name         = "NautilusStampUISDK"
  spec.version      = "0.0.1"
  spec.summary      = "ModuleApps 2.0 StampUI SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 StampUI SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/StampUI/Sources/*.{h,m}", "Nautilus-ios-sdk/StampUI/Sources/**/*.swift", "Nautilus-ios-sdk/StampUI/Sources/**/*.{h,m}"
    spec.exclude_files = "Nautilus-ios-sdk/StampUI/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/StampUI/Resources/moduleapps-stampcard-ui.json", "Nautilus-ios-sdk/StampUI/Resources/Assets.xcassets", "Nautilus-ios-sdk/StampUI/Sources/**/*.xib", "Nautilus-ios-sdk/StampUI/Sources/**/*.storyboard"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusStampUISDK.xcframework'
  end

  spec.frameworks = 'Foundation'
  spec.dependency "NautilusAnalyticsSDK", "#{spec.version}"
  spec.dependency "NautilusConfigSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusStampSDK", "#{spec.version}"
  spec.dependency "NautilusCodeReaderSDK", "#{spec.version}"
  spec.dependency "NautilusUISDK", "#{spec.version}"
  spec.dependency "NautilusServerTimeSDK", "#{spec.version}"
  spec.dependency "NautilusImagingSDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
