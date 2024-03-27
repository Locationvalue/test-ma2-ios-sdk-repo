Pod::Spec.new do |spec|
  spec.name         = "NautilusImagingSDK"
  spec.version      = "1.10.3"
  spec.summary      = "ModuleApps 2.0 Image Utility SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Image Utility SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Imaging/Sources/*.{h,m}", "Nautilus-ios-sdk/Imaging/Sources/**/*.swift", "Nautilus-ios-sdk/Imaging/Sources/**/*.{h,m}"
    spec.exclude_files = "Nautilus-ios-sdk/Imaging/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/Imaging/Resources/Nautilus.plist", "Nautilus-ios-sdk/Imaging/Resources/Nautilus_*.plist"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusImagingSDK.xcframework'
  end

  spec.frameworks = 'UIKit'

  spec.swift_version = '5.0'
end
