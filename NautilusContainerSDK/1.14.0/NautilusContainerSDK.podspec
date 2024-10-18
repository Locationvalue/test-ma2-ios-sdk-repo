Pod::Spec.new do |spec|
  spec.name         = "NautilusContainerSDK"
  spec.version      = "1.14.0"
  spec.summary      = "ModuleApps 2.0 Module Container System SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Module Container System SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Container/Sources/*.{h,m}", "Nautilus-ios-sdk/Container/Sources/**/*.swift"
    spec.exclude_files = "Nautilus-ios-sdk/Container/Sources/Exclude"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusContainerSDK.xcframework'
  end

  spec.frameworks = 'Foundation'

  spec.swift_version = '5.0'
end
