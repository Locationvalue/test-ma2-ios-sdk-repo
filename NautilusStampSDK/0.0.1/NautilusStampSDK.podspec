Pod::Spec.new do |spec|
  spec.name         = "NautilusStampSDK"
  spec.version      = "0.0.1"
  spec.summary      = "ModuleApps 2.0 Stamp SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Stamp SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source        = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Stamp/Sources/*.{h,m}", "Nautilus-ios-sdk/Stamp/Sources/**/*.swift", "Nautilus-ios-sdk/Stamp/Sources/**/*.{h,m}"
    spec.exclude_files = "Nautilus-ios-sdk/Stamp/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/Stamp/Resources/moduleapps-stamp.json", "Nautilus-ios-sdk/Stamp/Resources/Assets.xcassets", "Nautilus-ios-sdk/Stamp/Sources/**/*.xib"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusStampSDK.xcframework'
  end

  spec.frameworks = 'Foundation'
  spec.dependency "NautilusConfigSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusIdentifySDK", "#{spec.version}"
  spec.dependency "NautilusLoggingSDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
