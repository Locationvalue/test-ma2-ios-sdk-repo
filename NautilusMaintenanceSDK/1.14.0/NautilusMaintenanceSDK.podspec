Pod::Spec.new do |spec|
  spec.name         = "NautilusMaintenanceSDK"
  spec.version      = "1.14.0"
  spec.summary      = "ModuleApps 2.0 User Infomation Management SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Maintenance Check SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Maintenance/Sources/*.{h,m}", "Nautilus-ios-sdk/Maintenance/Sources/**/*.swift", "Nautilus-ios-sdk/Maintenance/Sources/**/*.{h,m}"
    spec.exclude_files = "Nautilus-ios-sdk/Maintenance/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/Maintenance/Resources/moduleapps-Maintenance.json", "Nautilus-ios-sdk/Maintenance/Resources/Assets.xcassets", "Nautilus-ios-sdk/Maintenance/Sources/**/*.xib"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusMaintenanceSDK.xcframework'
  end

  spec.frameworks = 'Foundation'
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusLoggingSDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
