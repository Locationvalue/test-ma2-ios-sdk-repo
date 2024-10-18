Pod::Spec.new do |spec|
  spec.name         = "NautilusLoggingSDK"
  spec.version      = "1.14.0"
  spec.summary      = "ModuleApps 2.0 Logging System SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Logging System SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Logging/Sources/*.{h,m}", "Nautilus-ios-sdk/Logging/Sources/**/*.swift"
    spec.exclude_files = "Nautilus-ios-sdk/Logging/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/Logging/Resources/Nautilus.plist", "Nautilus-ios-sdk/Logging/Resources/Nautilus_*.plist"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusLoggingSDK.xcframework'
  end

  spec.frameworks = 'Foundation'

  spec.swift_version = '5.0'
end
