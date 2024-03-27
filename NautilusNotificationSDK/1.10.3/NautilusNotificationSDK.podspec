Pod::Spec.new do |spec|
  spec.name         = "NautilusNotificationSDK"
  spec.version      = "1.10.3"
  spec.summary      = "ModuleApps 2.0 Notification Component SDK for iOS"
  spec.description  = <<-DESC
                      ModuleApps 2.0 Notification Component SDK
                      DESC
  spec.homepage     = "https://moduleapps.com"
  spec.license      = { :type => "Commercial", :text => "Copyright © DearOne, Inc. All Rights Reserved." }
  spec.author       = { "DearOne, Inc." => "sysadm@dearone.io" }
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"

  if ENV.has_key?('NAUTILUS_DEVELOP') then
    # Setting for development
    spec.source         = { :git => '' }
    spec.source_files  = "Nautilus-ios-sdk/Notification/Sources/*.{h,m}", "Nautilus-ios-sdk/Notification/Sources/**/*.swift", "Nautilus-ios-sdk/Notification/Sources/**/*.{h,m}"
    spec.exclude_files = "Nautilus-ios-sdk/Notification/Sources/Exclude"
    spec.resources = "Nautilus-ios-sdk/Notification/Resources/moduleapps-notification.json"
  else
    # Setting for release
    spec.source       = { :git => "https://github.com/Locationvalue/test-ma2-ios-sdk.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = 'NautilusNotificationSDK.xcframework'
  end

  spec.frameworks = 'Foundation', 'UserNotifications'
  spec.dependency "NautilusCoreSDK", "#{spec.version}"
  spec.dependency "NautilusContainerSDK", "#{spec.version}"
  spec.dependency "NautilusConfigSDK", "#{spec.version}"
  spec.dependency "NautilusIdentifySDK", "#{spec.version}"
  spec.dependency "NautilusLoggingSDK", "#{spec.version}"

  spec.swift_version = '5.0'
end
